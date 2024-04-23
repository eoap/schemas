# Stage-in example

## Stage-in generating a STAC Catalog CWL custom type

```
cwltool stage-in.cwl --reference https://planetarycomputer.microsoft.com/api/stac/v1/collections/landsat-c2-l2/items/LC09_L2SP_042033_20231015_02_T1
```

This workflow generates the output:

```json
{
    "staged": {
        "catalog_directory": {
            "class": "Directory",
            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3",
            "basename": "7kfajfy3",
            "listing": [
                {
                    "class": "File",
                    "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/stage.py",
                    "basename": "stage.py",
                    "size": 715,
                    "checksum": "sha1$0f75218b6531988165071f04d823fb18d18f1aae",
                    "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/stage.py"
                },
                {
                    "class": "Directory",
                    "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1",
                    "basename": "LC09_L2SP_042033_20231015_02_T1",
                    "listing": [
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B1.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B1.TIF",
                            "size": 88382660,
                            "checksum": "sha1$371d2fad151a994467f0f020f390564e4bc3b5b2",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B1.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B3.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B3.TIF",
                            "size": 92270552,
                            "checksum": "sha1$68bf68b4c264e5f828337f34fb9c493ccaf7e1b1",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B3.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_QA_PIXEL.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_QA_PIXEL.TIF",
                            "size": 947899,
                            "checksum": "sha1$374c67a088fd93b4abff3a6a71f7adb826c3ae24",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_QA_PIXEL.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_DRAD.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_DRAD.TIF",
                            "size": 18854733,
                            "checksum": "sha1$6602784a628cd007b8a517a2e52167f592d0dc5d",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_DRAD.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_02_T1.json",
                            "basename": "LC09_L2SP_042033_20231015_02_T1.json",
                            "size": 31523,
                            "checksum": "sha1$91c0acc0305feda305eefbcdf83c3f255e76eb2a",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_02_T1.json"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B4.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B4.TIF",
                            "size": 94085755,
                            "checksum": "sha1$323aad315e7c708c885bd910ea2ca6c41f86279e",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B4.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.json",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_MTL.json",
                            "size": 14395,
                            "checksum": "sha1$e1d29e4c5554ab27abf3e6e6b5df224affb43c0c",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.json"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMSD.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMSD.TIF",
                            "size": 17751917,
                            "checksum": "sha1$5c5b5a9624e8b3da4a22f144663247497a0f5e2f",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMSD.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B5.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B5.TIF",
                            "size": 95353496,
                            "checksum": "sha1$fc08c0db5aa9299880888bea037a76135f5cda87",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B5.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_QA.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_QA.TIF",
                            "size": 22516524,
                            "checksum": "sha1$8c942d59a3bd77578f55658020e1475afa2fd239",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_QA.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_URAD.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_URAD.TIF",
                            "size": 28725504,
                            "checksum": "sha1$c0f679036bc3c2c293e6f0f8e96c3c0ee224cde0",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_URAD.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMIS.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMIS.TIF",
                            "size": 20420550,
                            "checksum": "sha1$213aef70a466d9fe8f97c999978f80aed955ecb4",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_EMIS.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.txt",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_MTL.txt",
                            "size": 15262,
                            "checksum": "sha1$7ab390c0a5b67ba0150abf05b85775ed0aab5f7f",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.txt"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_B10.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_B10.TIF",
                            "size": 87473788,
                            "checksum": "sha1$2d4e630cf614491e387fd26b93babee637d6f6ab",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_B10.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B6.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B6.TIF",
                            "size": 96379210,
                            "checksum": "sha1$0d20743de130095b8b0a6e6d4b8a5e64d0aaa1aa",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B6.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_ATRAN.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_ATRAN.TIF",
                            "size": 31874816,
                            "checksum": "sha1$985deb01b7588e96685db1f465e6781e72ea4cda",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_ATRAN.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_QA_RADSAT.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_QA_RADSAT.TIF",
                            "size": 230417,
                            "checksum": "sha1$3efbb36aba104f3b13376bfccaf18e9bf431ea2a",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_QA_RADSAT.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B2.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B2.TIF",
                            "size": 89855930,
                            "checksum": "sha1$1fa4a5e68b12b282c6e87a1121c65f36d28cc997",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B2.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/preview.png",
                            "basename": "preview.png",
                            "size": 1341698,
                            "checksum": "sha1$964126289c17b84fd86bf634ea5c6432859b6884",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/preview.png"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_QA_AEROSOL.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_QA_AEROSOL.TIF",
                            "size": 2112000,
                            "checksum": "sha1$a5d14a304c50278c936a70d1f63dca8383de2b63",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_QA_AEROSOL.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_CDIST.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_CDIST.TIF",
                            "size": 22907968,
                            "checksum": "sha1$86fc1f389fb01bc66c51301eae8b2e77a9560ec8",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_CDIST.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B7.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_SR_B7.TIF",
                            "size": 95450385,
                            "checksum": "sha1$a7551a005881c7df32e94751eea2463e9dda3f6b",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B7.TIF"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ANG.txt",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ANG.txt",
                            "size": 117266,
                            "checksum": "sha1$a47c713a9a0c5c74b6c0a0ade4790ab26e44e9e6",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ANG.txt"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/tilejson.json",
                            "basename": "tilejson.json",
                            "size": 504,
                            "checksum": "sha1$10c0fa997458401847ef54d9df94b9175dca3939",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/tilejson.json"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.xml",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_MTL.xml",
                            "size": 22473,
                            "checksum": "sha1$846c7d792790176f0acd46ba31186ed66d31a6e3",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_MTL.xml"
                        },
                        {
                            "class": "File",
                            "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_TRAD.TIF",
                            "basename": "LC09_L2SP_042033_20231015_20231016_02_T1_ST_TRAD.TIF",
                            "size": 78636941,
                            "checksum": "sha1$dbeff04ae62f0dd70d1d9e4d6e57310d19529564",
                            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_TRAD.TIF"
                        }
                    ],
                    "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/LC09_L2SP_042033_20231015_02_T1"
                },
                {
                    "class": "File",
                    "location": "file:///data/work/eoap/schemas/examples/stage-in/7kfajfy3/catalog.json",
                    "basename": "catalog.json",
                    "size": 548,
                    "checksum": "sha1$51045a1904f234933ef8d46c1392252f66044512",
                    "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3/catalog.json"
                }
            ],
            "path": "/data/work/eoap/schemas/examples/stage-in/7kfajfy3"
        },
        "id": "catalog",
        "description": "staged catalog",
        "links": [
            {
                "rel": "self",
                "href": "catalog.json",
                "type": "application/json",
                "title": "staged catalog"
            }
        ]
    }
}
```

## Consuming a generated STAC Catalog CWL custom type

```
cwltool workflow.cwl --reference https://planetarycomputer.microsoft.com/api/stac/v1/collections/landsat-c2-l2/items/LC09_L2SP_042033_20231015_02_T1
```

This workflow generates a file with e.g.:

```
* <Catalog id=catalog>
  * <Item id=LC09_L2SP_042033_20231015_02_T1>
red /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B4.TIF
blue /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B2.TIF
green /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B3.TIF
nir08 /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B5.TIF
lwir11 /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_ST_B10.TIF
swir16 /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B6.TIF
swir22 /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B7.TIF
coastal /var/lib/cwl/stg619a4f95-099b-4db4-9b1d-d5763038aaa5/s5wx_3r1/LC09_L2SP_042033_20231015_02_T1/LC09_L2SP_042033_20231015_20231016_02_T1_SR_B1.TIF
```