{
  "$GMObject":"",
  "%Name":"obj_enemy_card",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_enemy_card",
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
    {"$GMObjectProperty":"v1","%Name":"placement","filters":[],"listItems":[],"multiselect":false,"name":"placement","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"card_stats","filters":[],"listItems":[],"multiselect":false,"name":"card_stats","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"noone","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"card_speed","filters":[],"listItems":[],"multiselect":false,"name":"card_speed","rangeEnabled":true,"rangeMax":16.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"flip_speed","filters":[],"listItems":[],"multiselect":false,"name":"flip_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.08","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"wound_spacing","filters":[],"listItems":[],"multiselect":false,"name":"wound_spacing","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"2","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"attack_animation_speed","filters":[],"listItems":[],"multiselect":false,"name":"attack_animation_speed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"enemy_to_board","filters":[],"listItems":[],"multiselect":false,"name":"enemy_to_board","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"True","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"enemy_on_board","filters":[],"listItems":[],"multiselect":false,"name":"enemy_on_board","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"flip_active","filters":[],"listItems":[],"multiselect":false,"name":"flip_active","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"flip_finished","filters":[],"listItems":[],"multiselect":false,"name":"flip_finished","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"wounds","filters":[],"listItems":[],"multiselect":false,"name":"wounds","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"variable_name","filters":[],"listItems":[],"multiselect":false,"name":"variable_name","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"conditions","filters":[],"listItems":[
        "\"bleed\"",
        "\"frostbite\"",
        "\"poison\"",
        "\"stagger\"",
      ],"multiselect":true,"name":"conditions","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":6,},
    {"$GMObjectProperty":"v1","%Name":"deck","filters":[],"listItems":[],"multiselect":false,"name":"deck","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":{"name":"obj_enemy_deck","path":"objects/obj_enemy_deck/obj_enemy_deck.yy",},"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"obj_enemy_deck","varType":5,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_enemy_card_sm_front",
    "path":"sprites/spr_enemy_card_sm_front/spr_enemy_card_sm_front.yy",
  },
  "spriteMaskId":null,
  "tags":[
    "enemy",
  ],
  "visible":true,
}