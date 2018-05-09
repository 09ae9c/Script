# IncreaseVersion

This script can increase version name and version code for your project

the `versionName` format is [MajorNumber].[MinorNumber].[RevisionNumber]

## Usages

make sure you have already a `version.properties` file defined in your project, and it's content looks like:

```
versionCode=1
versionName=1.0.0
```
then execute this script:

```
./increaseVersion
```
after works done, the `version.properties` changes to:

```
versionCode=2
versionName=1.0.1
```

if you just want increase major/minor/reversion number, add [type] option

```
./increaseVersion major
```
after works done, the `version.properties` changes to:

```
versionCode=2
versionName=2.0.0
```

if you want increase to some specific number, add [offset] option

```
./increaseVersion minor 5
```
after works done, the `version.properties` changes to:

```
versionCode=2
versionName=1.5.0
```

## Options

- major [offset]:       increase major number, reset minor and reversion number

- minor [offset]:       increase minor number, reset reversion number

- reversion  [offset]:  increase reversion number

- help:                 show usages