#!/usr/bin/python
# -*- coding: UTF-8 -*-

# quickly publish quiver note to Hexo remote blog
# -p: source quiver library path, should like: Quiver.qvlibrary
# -t: tag to publish, only publish note which has this tag
# -o: output path for parsed files
# -c: publish command after output
# author: 09ae9c@gmail.com

import os
import json
import time
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-p', required=True, help='path to quiver library')
parser.add_argument('-t', required=True, help='tag for notes to publish')
parser.add_argument('-o', required=True, help='output path for parsed files')
parser.add_argument('-c', required=True, help='publish command after output')
args = parser.parse_args()

# load all notes from Quiver.qvlibrary
# data format:
# Quiver.qvlibrary
# 	-- xxxx.qvnotebook
# 		-- xxxx.qvnote
# 			-- content.json
# 			-- meta.json
# 		-- meta.json
# 	-- meta.json
def load_notes(path):
	all_notes_path = []
	for notebook in os.listdir(path):
		notes = path+'/'+notebook
		if os.path.isdir(notes):
			for note in os.listdir(notes):				
				if os.path.splitext(note)[1] == '.qvnote':
					all_notes_path.append(notes+'/'+note)	
	return all_notes_path


# judge whether meta contains specified tag
# meta format:
# {"tags": ["xxx",], "title": "xxx"}
def meta_contains_tag(meta_path, tag):
	with open(meta_path, encoding='utf-8') as f:
		meta_json = json.load(f)		
	return tag in meta_json['tags']


# filter notes with specified tag
def filter_notes(all_notes_path, tag):
	all_tag_note_path = []
	for note in all_notes_path:
		if meta_contains_tag(note+'/meta.json', tag):
			all_tag_note_path.append(note)
	return all_tag_note_path


# create target filename from meta.json
# filename format: {timestamp}.md
def create_filename_from_meta(meta_path):
	with open(meta_path,'r') as f:
		meta_json = json.load(f)
		time_local = time.localtime(int(meta_json['created_at']))
		return time.strftime('%Y%m%d%H',time_local) + '.md'


# read markdown cell from content.json
# @param file: target content.json file
# @param type: read cell type, Quiver has types: ["text","code","markdown","latex"]
# content.json format:
# {"title": "xxx", "cells": [{"type": "markdown", "data": "xxx"}]}
def read_cell_from_content(file,type):
	result = ''
	content_json = json.load(file)
	for cell in content_json['cells']:
		if cell['type'] == type:
			result += cell['data']
	
	return result

# write notes to specified output path with target type cells
# @param notes_path: original notes path in Quiver library
# @param output_path: parsed and rewrited file path to store
# @param type: parse for target type cells
def write_output(notes_path,output_path,type):
	for note_path in notes_path:
		with open(note_path+'/content.json','r') as f:
			filename = create_filename_from_meta(note_path+'/meta.json')
			with open(output_path+'/'+filename, 'w') as wf:
				wf.write(read_cell_from_content(f,type))		


def execute_publish_cmd(path,cmd):
	real_cmd = 'cd '+path + '; ' + cmd
	os.system(real_cmd)


#############################################################
# Main process
#############################################################

# load all notes from Quiver library
all_library_notes = load_notes(args.p)

# filter notes for specified arg
filtered_notes = filter_notes(all_library_notes,args.t)

write_output(filtered_notes,args.o,'markdown')

execute_publish_cmd(args.o,args.c)

