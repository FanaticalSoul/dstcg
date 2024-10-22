{
  "$GMObject":"",
  "%Name":"obj_enemy_deck",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_enemy_deck",
  "overriddenProperties":[],
  "parent":{
    "name":"Enemy Cards",
    "path":"folders/Objects/Enemy Cards.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"deck_max","filters":[],"listItems":[],"multiselect":false,"name":"deck_max","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"20","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"deck_spacing_width_in_pixels","filters":[],"listItems":[],"multiselect":false,"name":"deck_spacing_width_in_pixels","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"6","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"enemy_field_offset","filters":[],"listItems":[
        "0",
        "56",
      ],"multiselect":true,"name":"enemy_field_offset","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0, 56","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"card_draw_frame_delay","filters":[],"listItems":[],"multiselect":false,"name":"card_draw_frame_delay","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"8","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_card_sm_selected",
    "path":"sprites/spr_card_sm_selected/spr_card_sm_selected.yy",
  },
  "spriteMaskId":null,
  "tags":[
    "enemy",
  ],
  "visible":true,
}