{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "prueba1 Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninternal:\n    var i: integer\n    var j: integer\n    var k: integer\n    var l: integer\n\ninterface: \n    in event UsrPressA\n    in event UsrPressB\n    in event UsrPressC\n    in event UsrPressD\n    \n"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 58,
          "y": 14
        },
        "size": {
          "height": 400,
          "width": 2575
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "47725721-b21e-4414-a5ed-ce79f96a9d61",
        "z": 90,
        "embeds": [
          "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed"
        ],
        "attrs": {
          "name": {
            "text": "MainMenu",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 0,
          "y": 200
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 450,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "attrs": {}
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 0,
          "y": 215
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 451,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "47725721-b21e-4414-a5ed-ce79f96a9d61",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 218,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1c71a088-5563-409c-ab57-8acba29a78dd",
        "z": 452,
        "vertices": [
          {
            "x": 7.5,
            "y": 231
          }
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 278,
          "y": 534
        },
        "size": {
          "height": 250,
          "width": 2112
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "26619cb5-9ea6-4b93-9068-650b115b9697",
        "z": 453,
        "embeds": [
          "5abe2ef9-d987-4432-9564-11cfc8fd0600"
        ],
        "attrs": {
          "name": {
            "text": "setup",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 281,
          "y": 555.796875
        },
        "size": {
          "height": 227.203125,
          "width": 2110
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "z": 454,
        "embeds": [
          "f65122bc-64b3-47e9-b272-fe6b4f9dca71",
          "e96b472c-8c9f-4675-ae0c-9c7daf43263a",
          "fc52c9e5-f40a-40a7-b225-1fab18c70918",
          "91874ae8-bde3-4a10-b3fb-fbc63f7be6e7",
          "7c668b71-2463-4e13-96cd-e83e3d7c0c18",
          "dfb8d0ff-6fd9-4a1e-8fd1-1ab98460ae9d",
          "0dd78bd6-f267-41da-a517-7d67e3a792ed",
          "b5e8e6ba-f5eb-4f6a-9a9c-229bfe3c1182",
          "d0cfde3c-3fd3-48ac-9726-5132026d82fd",
          "f676372e-8eae-4357-a55e-beda6a1abcb5",
          "9446cb28-32fe-4488-87b4-e4888b3785be",
          "d66749ba-0ab3-48ca-a0c8-6921a6485e92",
          "5b09739a-3183-481b-addc-3e2830f7c3e8",
          "d3d22cad-fb2c-4b34-be2f-04687354fc39",
          "fe29bf65-5b82-40e4-bc57-108598419968",
          "2e36b09a-8555-4774-916a-5e1895a1e4f0",
          "cd660fce-079e-4dff-9b55-7c5d93953cd4",
          "3671dcb9-474f-47cc-b797-a4a3d76b7d71",
          "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2",
          "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf",
          "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4"
        ],
        "parent": "26619cb5-9ea6-4b93-9068-650b115b9697",
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 338,
          "y": 611
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "d3d22cad-fb2c-4b34-be2f-04687354fc39",
        "z": 455,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "embeds": [
          "60efd5d6-5310-4079-86b2-6a1c09bd1f7a"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 761,
          "y": 592
        },
        "size": {
          "height": 96,
          "width": 137
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "fe29bf65-5b82-40e4-bc57-108598419968",
        "z": 456,
        "embeds": [],
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "Resum",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 431,
          "y": 595
        },
        "size": {
          "height": 93,
          "width": 124
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
        "z": 457,
        "embeds": [
          "9cf69a39-b548-4214-a8c5-4082ca19335f"
        ],
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "SetTarif",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1686,
          "y": 596
        },
        "size": {
          "height": 90,
          "width": 127
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "cd660fce-079e-4dff-9b55-7c5d93953cd4",
        "z": 458,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "CambiarClave",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 2199,
          "y": 596
        },
        "size": {
          "height": 80,
          "width": 108
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "3671dcb9-474f-47cc-b797-a4a3d76b7d71",
        "z": 459,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "embeds": [
          "bb8075e3-91b6-4191-b944-e6d03137c4fc"
        ],
        "attrs": {
          "name": {
            "text": "BorrarPlaya",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1959,
          "y": 596
        },
        "size": {
          "height": 90,
          "width": 110
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2",
        "z": 460,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "SetTime",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1091,
          "y": 590
        },
        "size": {
          "height": 88,
          "width": 123
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf",
        "z": 461,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "ListarUltimos",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1390,
          "y": 586
        },
        "size": {
          "height": 94,
          "width": 123
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4",
        "z": 462,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {
          "name": {
            "text": "LimpiarData",
            "fontSize": 12
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 338,
          "y": 626
        },
        "id": "60efd5d6-5310-4079-86b2-6a1c09bd1f7a",
        "z": 476,
        "parent": "d3d22cad-fb2c-4b34-be2f-04687354fc39",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4"
        },
        "target": {
          "id": "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 100,
              "dy": 79,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7c668b71-2463-4e13-96cd-e83e3d7c0c18",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf"
        },
        "target": {
          "id": "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 30,
              "dy": 38,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "91874ae8-bde3-4a10-b3fb-fbc63f7be6e7",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2"
        },
        "target": {
          "id": "3671dcb9-474f-47cc-b797-a4a3d76b7d71",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 12,
              "dy": 35,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b5e8e6ba-f5eb-4f6a-9a9c-229bfe3c1182",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "3671dcb9-474f-47cc-b797-a4a3d76b7d71"
        },
        "target": {
          "id": "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 109,
              "dy": 73,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0dd78bd6-f267-41da-a517-7d67e3a792ed",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2"
        },
        "target": {
          "id": "cd660fce-079e-4dff-9b55-7c5d93953cd4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 107,
              "dy": 75,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "dfb8d0ff-6fd9-4a1e-8fd1-1ab98460ae9d",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4"
        },
        "target": {
          "id": "cd660fce-079e-4dff-9b55-7c5d93953cd4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 26,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e96b472c-8c9f-4675-ae0c-9c7daf43263a",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "cd660fce-079e-4dff-9b55-7c5d93953cd4"
        },
        "target": {
          "id": "6d04a808-3a38-4e8b-b2d3-3fe2bc0e12f2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 28,
              "dy": 34,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d0cfde3c-3fd3-48ac-9726-5132026d82fd",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "cd660fce-079e-4dff-9b55-7c5d93953cd4"
        },
        "target": {
          "id": "9f2aeda4-c0e9-4d90-b07c-4c60d23a98b4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 108,
              "dy": 79,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "fc52c9e5-f40a-40a7-b225-1fab18c70918",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0"
        },
        "target": {
          "id": "fe29bf65-5b82-40e4-bc57-108598419968",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10,
              "dy": 33,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5b09739a-3183-481b-addc-3e2830f7c3e8",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf"
        },
        "target": {
          "id": "fe29bf65-5b82-40e4-bc57-108598419968",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 134,
              "dy": 79,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f65122bc-64b3-47e9-b272-fe6b4f9dca71",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fe29bf65-5b82-40e4-bc57-108598419968"
        },
        "target": {
          "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 118,
              "dy": 65,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9446cb28-32fe-4488-87b4-e4888b3785be",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fe29bf65-5b82-40e4-bc57-108598419968"
        },
        "target": {
          "id": "ad05b1f7-a97e-4cf8-9d8c-861e1109e1bf",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 12,
              "dy": 34,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f676372e-8eae-4357-a55e-beda6a1abcb5",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d3d22cad-fb2c-4b34-be2f-04687354fc39"
        },
        "target": {
          "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 28,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d66749ba-0ab3-48ca-a0c8-6921a6485e92",
        "z": 477,
        "parent": "5abe2ef9-d987-4432-9564-11cfc8fd0600",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "47725721-b21e-4414-a5ed-ce79f96a9d61"
        },
        "target": {
          "id": "26619cb5-9ea6-4b93-9068-650b115b9697",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 226,
              "dy": 2,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressC"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c44439b8-a687-47b0-88be-de2fe5f8f7dd",
        "z": 477,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "26619cb5-9ea6-4b93-9068-650b115b9697"
        },
        "target": {
          "x": 2087,
          "y": 321,
          "id": "47725721-b21e-4414-a5ed-ce79f96a9d61",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2029,
              "dy": 309,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressC"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "63afe2ab-a0e6-420b-a2ae-9cb003801db4",
        "z": 477,
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 48,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 9,
              "dy": 75,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [l==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9cf69a39-b548-4214-a8c5-4082ca19335f",
        "z": 477,
        "parent": "2e36b09a-8555-4774-916a-5e1895a1e4f0",
        "vertices": [
          {
            "x": 382,
            "y": 643
          },
          {
            "x": 353,
            "y": 670
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "3671dcb9-474f-47cc-b797-a4a3d76b7d71"
        },
        "target": {
          "id": "3671dcb9-474f-47cc-b797-a4a3d76b7d71",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 81,
              "dy": 35,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [l==1]"
              }
            },
            "position": {
              "distance": 0.6619061320012011,
              "offset": 44.82676664990607,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "bb8075e3-91b6-4191-b944-e6d03137c4fc",
        "z": 478,
        "parent": "3671dcb9-474f-47cc-b797-a4a3d76b7d71",
        "vertices": [
          {
            "x": 2345,
            "y": 676
          }
        ],
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 59,
          "y": 35.796875
        },
        "size": {
          "height": 377.203125,
          "width": 2573
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "z": 479,
        "embeds": [
          "90ceb8e3-5d29-40e0-ad40-0a17ce22e131",
          "1317937a-c7f8-4b30-ad0f-f02512415cd8",
          "d29e287b-a6be-47d5-b754-95daa81cc1b8",
          "0a375096-2c5d-4c72-b955-0b7e40a2c645",
          "7eca1058-dee3-41c9-888e-0815334714c9",
          "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
          "d6a9fb9b-9323-4afe-87cc-677983e16aa6",
          "772d6098-b848-4afc-a309-7fa0b94776da",
          "fce8e47f-9c3d-40aa-99d6-34b732e9d855"
        ],
        "parent": "47725721-b21e-4414-a5ed-ce79f96a9d61",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 155,
          "y": 151
        },
        "size": {
          "height": 227,
          "width": 596
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
        "z": 480,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "embeds": [
          "a2446ff8-7aa5-43c9-9bd8-616f16a8c228",
          "06834a22-315c-4d11-98b3-c9c4c908f4bc"
        ],
        "attrs": {
          "name": {
            "text": "Ingreso",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 82,
          "y": 178
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "d6a9fb9b-9323-4afe-87cc-677983e16aa6",
        "z": 481,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "embeds": [
          "df7ac6e6-6205-4ba4-a584-d804acf5e8c8"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 1413,
          "y": 154
        },
        "size": {
          "height": 167,
          "width": 1132
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "772d6098-b848-4afc-a309-7fa0b94776da",
        "z": 482,
        "embeds": [
          "23c03046-526c-4f10-8af2-d994948ec657",
          "e3140b52-56a1-4a54-bd3f-0d7573677f06"
        ],
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {
          "name": {
            "text": "ComandosOp",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 890,
          "y": 128
        },
        "size": {
          "height": 201,
          "width": 425
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "fce8e47f-9c3d-40aa-99d6-34b732e9d855",
        "z": 483,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "embeds": [
          "99a27c75-ecf5-431c-a434-36f269b91fd2"
        ],
        "attrs": {
          "name": {
            "text": "Retiro",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 156,
          "y": 172.796875
        },
        "size": {
          "height": 204.203125,
          "width": 594
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "z": 489,
        "parent": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
        "embeds": [
          "f5e4eaf6-7445-41d4-b534-37790da87d54",
          "c1e82032-94c1-4332-a1b5-2f5e06f5a9d8",
          "4cf538c4-231f-481c-80b7-45e1e7e1191d",
          "18e3cc7e-e61d-4267-ba7a-c5c39da5622b",
          "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
          "2769f22d-0918-4a40-b45f-62bf85bb6900"
        ],
        "attrs": {}
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 82,
          "y": 193
        },
        "id": "df7ac6e6-6205-4ba4-a584-d804acf5e8c8",
        "z": 491,
        "parent": "d6a9fb9b-9323-4afe-87cc-677983e16aa6",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 1414,
          "y": 175.796875
        },
        "size": {
          "height": 144.203125,
          "width": 1130
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "z": 492,
        "parent": "772d6098-b848-4afc-a309-7fa0b94776da",
        "embeds": [
          "e9fc0684-3248-4e68-a528-94d5f9b1deed",
          "8c9d46fa-76c9-4439-bfef-6e626aacb056",
          "308b556d-db37-4833-8f84-912dd8e7a46e",
          "0d52087c-e864-45f1-956b-6488e41ec693",
          "564acbe8-57c5-4fcf-88fb-1eed5b6a955a",
          "27d0fd91-e07a-444c-b809-31e71c3f5b2e",
          "83b19437-6552-4c7f-b327-4965215d9043",
          "29d3d70a-8ec4-455b-bb73-570a3fe068c9",
          "dc035685-ef1c-4481-a833-a04cf38a264f",
          "95b7af89-d876-482b-a870-bc309793d185",
          "bcaf17e8-507f-413a-802f-d3ac3a4c85aa",
          "994e3b6e-237e-4fd3-90fc-393cfd444007",
          "6527326d-0302-4ff7-aab1-664b33563533",
          "a521ab06-39f6-4562-bbe1-16766459724c",
          "81ae4688-413b-42b0-8e18-b29e8df7fe3b"
        ],
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 891,
          "y": 149.796875
        },
        "size": {
          "height": 178.203125,
          "width": 423
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "z": 494,
        "parent": "fce8e47f-9c3d-40aa-99d6-34b732e9d855",
        "embeds": [
          "6de57719-4d2e-4d76-97b7-b5a91ae0a0c3",
          "7cb077a2-8e21-4b72-aaa1-3815ec5a8404",
          "da4ce322-625d-44b2-9bd2-14acc8deeeaf",
          "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
          "16d6d95e-f1a4-4621-b044-5f7fbb064279"
        ],
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 168,
          "y": 207.5
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "18e3cc7e-e61d-4267-ba7a-c5c39da5622b",
        "z": 495,
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "embeds": [
          "cb260cbf-1fd2-48a3-8331-245244022683"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 274,
          "y": 197
        },
        "size": {
          "height": 95,
          "width": 78
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
        "z": 496,
        "embeds": [
          "a84a290e-c9d8-4ec4-add5-86eecff96409"
        ],
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "attrs": {
          "name": {
            "text": "IngPat",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 541,
          "y": 203
        },
        "size": {
          "height": 90,
          "width": 105
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2769f22d-0918-4a40-b45f-62bf85bb6900",
        "z": 497,
        "embeds": [
          "5d1620d4-015a-48a1-a221-583f9e013d8c"
        ],
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "attrs": {
          "name": {
            "text": "IngCat",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1473,
          "y": 200
        },
        "size": {
          "height": 71,
          "width": 66
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "95b7af89-d876-482b-a870-bc309793d185",
        "z": 501,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "embeds": [
          "d2066604-bf72-4afc-8f0e-1cfe8a2ced83"
        ],
        "attrs": {
          "name": {
            "text": "Time",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 1428,
          "y": 206
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "bcaf17e8-507f-413a-802f-d3ac3a4c85aa",
        "z": 502,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "embeds": [
          "01a66aca-8c4f-4e0e-8c67-94d63535b131"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 2380,
          "y": 204
        },
        "size": {
          "height": 68,
          "width": 119
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "994e3b6e-237e-4fd3-90fc-393cfd444007",
        "z": 503,
        "embeds": [
          "6bd2c260-0b7c-4ef2-bd6b-aa8c6958316f"
        ],
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {
          "name": {
            "text": "ListVehClase",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 2177,
          "y": 202
        },
        "size": {
          "height": 67,
          "width": 82
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "6527326d-0302-4ff7-aab1-664b33563533",
        "z": 505,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {
          "name": {
            "text": "CajaAcum",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1928,
          "y": 199
        },
        "size": {
          "height": 76,
          "width": 108.96875
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "a521ab06-39f6-4562-bbe1-16766459724c",
        "z": 508,
        "embeds": [],
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {
          "name": {
            "text": "ListVehCobrados",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1679,
          "y": 196
        },
        "size": {
          "height": 81,
          "width": 104
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "81ae4688-413b-42b0-8e18-b29e8df7fe3b",
        "z": 511,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {
          "name": {
            "text": "ListVehPlaya",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 933,
          "y": 179
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "da4ce322-625d-44b2-9bd2-14acc8deeeaf",
        "z": 516,
        "parent": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "embeds": [
          "f13f1baf-913d-454c-ba6c-31740e9666ae"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 992,
          "y": 171.5
        },
        "size": {
          "height": 71,
          "width": 107
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
        "z": 517,
        "parent": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "embeds": [
          "29fb27b1-4143-454e-80a7-37b4d9925a41"
        ],
        "attrs": {
          "name": {
            "text": "IngTicket",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1229,
          "y": 178
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "16d6d95e-f1a4-4621-b044-5f7fbb064279",
        "z": 518,
        "parent": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "embeds": [],
        "attrs": {
          "name": {
            "text": "Salida",
            "fontSize": 12
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 168,
          "y": 222.5
        },
        "id": "cb260cbf-1fd2-48a3-8331-245244022683",
        "z": 521,
        "parent": "18e3cc7e-e61d-4267-ba7a-c5c39da5622b",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 1428,
          "y": 221
        },
        "id": "01a66aca-8c4f-4e0e-8c67-94d63535b131",
        "z": 525,
        "parent": "bcaf17e8-507f-413a-802f-d3ac3a4c85aa",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 933,
          "y": 194
        },
        "id": "f13f1baf-913d-454c-ba6c-31740e9666ae",
        "z": 527,
        "parent": "da4ce322-625d-44b2-9bd2-14acc8deeeaf",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 100,
              "dy": 36.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "16d6d95e-f1a4-4621-b044-5f7fbb064279",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 58,
              "dy": 43,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [j==1]"
              }
            },
            "position": {
              "distance": 0.6846491576832845,
              "offset": 24.76224108719824,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6de57719-4d2e-4d76-97b7-b5a91ae0a0c3",
        "z": 528,
        "vertices": [
          {
            "x": 1161,
            "y": 208
          }
        ],
        "parent": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "da4ce322-625d-44b2-9bd2-14acc8deeeaf"
        },
        "target": {
          "id": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 3,
              "dy": 20.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7cb077a2-8e21-4b72-aaa1-3815ec5a8404",
        "z": 528,
        "parent": "99a27c75-ecf5-431c-a434-36f269b91fd2",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "81ae4688-413b-42b0-8e18-b29e8df7fe3b"
        },
        "target": {
          "id": "a521ab06-39f6-4562-bbe1-16766459724c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 9,
              "dy": 27,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0d52087c-e864-45f1-956b-6488e41ec693",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a521ab06-39f6-4562-bbe1-16766459724c"
        },
        "target": {
          "id": "81ae4688-413b-42b0-8e18-b29e8df7fe3b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 58,
              "dy": 54,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e9fc0684-3248-4e68-a528-94d5f9b1deed",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a521ab06-39f6-4562-bbe1-16766459724c"
        },
        "target": {
          "id": "6527326d-0302-4ff7-aab1-664b33563533",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 24,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "27d0fd91-e07a-444c-b809-31e71c3f5b2e",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6527326d-0302-4ff7-aab1-664b33563533",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6,
              "dy": 59,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "a521ab06-39f6-4562-bbe1-16766459724c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 65,
              "dy": 62,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "564acbe8-57c5-4fcf-88fb-1eed5b6a955a",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6527326d-0302-4ff7-aab1-664b33563533"
        },
        "target": {
          "id": "994e3b6e-237e-4fd3-90fc-393cfd444007",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 1,
              "dy": 22,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "29d3d70a-8ec4-455b-bb73-570a3fe068c9",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "994e3b6e-237e-4fd3-90fc-393cfd444007",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 57,
              "dy": 61,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "994e3b6e-237e-4fd3-90fc-393cfd444007",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 115,
              "dy": 22,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [k==1]"
              }
            },
            "position": {
              "distance": 0.7004617450526409,
              "offset": 36.8346112839038,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6bd2c260-0b7c-4ef2-bd6b-aa8c6958316f",
        "z": 528,
        "parent": "994e3b6e-237e-4fd3-90fc-393cfd444007",
        "vertices": [
          {
            "x": 2525,
            "y": 264
          },
          {
            "x": 2525,
            "y": 234
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "994e3b6e-237e-4fd3-90fc-393cfd444007"
        },
        "target": {
          "id": "6527326d-0302-4ff7-aab1-664b33563533",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 62,
              "dy": 60,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "83b19437-6552-4c7f-b327-4965215d9043",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "81ae4688-413b-42b0-8e18-b29e8df7fe3b"
        },
        "target": {
          "id": "95b7af89-d876-482b-a870-bc309793d185",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 62,
              "dy": 62,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "308b556d-db37-4833-8f84-912dd8e7a46e",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "bcaf17e8-507f-413a-802f-d3ac3a4c85aa"
        },
        "target": {
          "id": "95b7af89-d876-482b-a870-bc309793d185",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 22,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "dc035685-ef1c-4481-a833-a04cf38a264f",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "95b7af89-d876-482b-a870-bc309793d185"
        },
        "target": {
          "id": "81ae4688-413b-42b0-8e18-b29e8df7fe3b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 23,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [k==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8c9d46fa-76c9-4439-bfef-6e626aacb056",
        "z": 528,
        "parent": "e3140b52-56a1-4a54-bd3f-0d7573677f06",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "95b7af89-d876-482b-a870-bc309793d185",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 41,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "95b7af89-d876-482b-a870-bc309793d185",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 11,
              "dy": 60,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [k==1]"
              }
            },
            "position": {
              "distance": 0.560539594459712,
              "offset": 61.12079828844249,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d2066604-bf72-4afc-8f0e-1cfe8a2ced83",
        "z": 528,
        "parent": "95b7af89-d876-482b-a870-bc309793d185",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fce8e47f-9c3d-40aa-99d6-34b732e9d855"
        },
        "target": {
          "id": "772d6098-b848-4afc-a309-7fa0b94776da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 55,
              "dy": 41,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0a375096-2c5d-4c72-b955-0b7e40a2c645",
        "z": 528,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "772d6098-b848-4afc-a309-7fa0b94776da"
        },
        "target": {
          "id": "fce8e47f-9c3d-40aa-99d6-34b732e9d855",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 157,
              "dy": 109,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB"
              }
            },
            "position": {
              "distance": 0.46938775510204084,
              "offset": 13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "90ceb8e3-5d29-40e0-ad40-0a17ce22e131",
        "z": 528,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "772d6098-b848-4afc-a309-7fa0b94776da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 175,
              "dy": 119,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "x": 2101,
          "y": 192,
          "id": "772d6098-b848-4afc-a309-7fa0b94776da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 688,
              "dy": 48,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA"
              }
            },
            "position": {
              "distance": 0.40654444762891556,
              "offset": 47,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "23c03046-526c-4f10-8af2-d994948ec657",
        "z": 528,
        "parent": "772d6098-b848-4afc-a309-7fa0b94776da",
        "vertices": [
          {
            "x": 2587,
            "y": 273
          },
          {
            "x": 2587,
            "y": 262
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2769f22d-0918-4a40-b45f-62bf85bb6900"
        },
        "target": {
          "id": "2769f22d-0918-4a40-b45f-62bf85bb6900",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 95,
              "dy": 35,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [i==1]"
              }
            },
            "position": {
              "offset": -21,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5d1620d4-015a-48a1-a221-583f9e013d8c",
        "z": 528,
        "parent": "2769f22d-0918-4a40-b45f-62bf85bb6900",
        "vertices": [
          {
            "x": 680,
            "y": 217
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2769f22d-0918-4a40-b45f-62bf85bb6900"
        },
        "target": {
          "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 75,
              "dy": 69,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [i==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c1e82032-94c1-4332-a1b5-2f5e06f5a9d8",
        "z": 528,
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5"
        },
        "target": {
          "id": "2769f22d-0918-4a40-b45f-62bf85bb6900",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6,
              "dy": 24,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA [i==1]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f5e4eaf6-7445-41d4-b534-37790da87d54",
        "z": 528,
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 42,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 8,
              "dy": 69,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [i==1]"
              }
            },
            "position": {
              "distance": 0.6177661615572484,
              "offset": 29.712129875939656,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a84a290e-c9d8-4ec4-add5-86eecff96409",
        "z": 528,
        "parent": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
        "vertices": [
          {
            "x": 242,
            "y": 239
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "18e3cc7e-e61d-4267-ba7a-c5c39da5622b"
        },
        "target": {
          "id": "064a1f7c-3ea0-4d95-a0e0-c96b8b41aae5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 28,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4cf538c4-231f-481c-80b7-45e1e7e1191d",
        "z": 528,
        "parent": "06834a22-315c-4d11-98b3-c9c4c908f4bc",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fce8e47f-9c3d-40aa-99d6-34b732e9d855"
        },
        "target": {
          "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 126,
              "dy": 110,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d29e287b-a6be-47d5-b754-95daa81cc1b8",
        "z": 528,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d6a9fb9b-9323-4afe-87cc-677983e16aa6"
        },
        "target": {
          "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6,
              "dy": 30,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7eca1058-dee3-41c9-888e-0815334714c9",
        "z": 528,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a"
        },
        "target": {
          "id": "fce8e47f-9c3d-40aa-99d6-34b732e9d855",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 30,
              "dy": 49,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressA"
              }
            },
            "position": {
              "distance": 0.4892086330935252,
              "offset": -28,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1317937a-c7f8-4b30-ad0f-f02512415cd8",
        "z": 528,
        "parent": "d38422fa-09f6-4c2d-a0db-5393f2a2b3ed",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 6,
              "dy": 75,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 14,
              "dy": 102,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a2446ff8-7aa5-43c9-9bd8-616f16a8c228",
        "z": 528,
        "parent": "2ea7b92a-b8c3-431c-82cb-0f53f5110b6a",
        "vertices": [
          {
            "x": 98,
            "y": 238
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce"
        },
        "target": {
          "id": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 0,
              "dy": 41.5,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "UsrPressB [j==1]"
              }
            },
            "position": {
              "distance": 0.32547954598009665,
              "offset": -23,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "29fb27b1-4143-454e-80a7-37b4d9925a41",
        "z": 528,
        "parent": "2d88ec87-1fc5-4af2-b1c7-94bb0c967bce",
        "vertices": [
          {
            "x": 946,
            "y": 233
          }
        ],
        "attrs": {}
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "Prueba1",
          "statemachinePrefix": "prueba1",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}