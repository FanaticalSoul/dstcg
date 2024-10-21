{
  "$GMObject":"",
  "%Name":"obj_hero_card",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":7,"eventType":6,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_hero_card",
  "overriddenProperties":[],
  "parent":{
    "name":"Hero Cards",
    "path":"folders/Objects/Hero Cards.yy",
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
    {"$GMObjectProperty":"v1","%Name":"card_speed","filters":[],"listItems":[],"multiselect":false,"name":"card_speed","rangeEnabled":true,"rangeMax":16.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"4","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"hero_class","filters":[],"listItems":[
        "\"assassin\"",
        "\"herald\"",
        "\"knight\"",
        "\"sorcerer\"",
      ],"multiselect":false,"name":"hero_class","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"\"assassin\"","varType":6,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_hero_card_sm_front",
    "path":"sprites/spr_hero_card_sm_front/spr_hero_card_sm_front.yy",
  },
  "spriteMaskId":null,
  "tags":[
    "hero",
  ],
  "visible":true,
}