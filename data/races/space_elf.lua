-- ELVES WOHH
local SpaceElf = {

  name = 'Space Elves',
  name_singular = 'Space Elf',
  name_short = 'Elf',

  intelligence =  { 
    sentient = true, 
    int_types = {logical = 'medium', musical = 'high', social = 'high'}
  },

  creature_build = { 
    classification = 'mammal',
    gender = {types = {'male', 'female'}, dimorphism = 'average'},
    body = { 
      shape_type = 'humanoid',
      build_diversity = 'medium',
      build_tendencies = {'lean', 'fit'},
      tissue = 'flesh',
      structure = 'skeletal',
      parts = { 
        head =  { eyes = 2, nose = 1, ears = 2, brain = true }, 
        torso = { organs = {'heart', 'intestines', 'liver'}, spine = true },
        limbs = { arms = { num = 2, appendage = 'hands'}, 
                  legs = { num = 2, appendage = 'feet' } },
      },
      hair = {'head', 'facial'}
    },
  },

  traits = {
    humanoid_traits = true,
    racial = {'Pointy Ears', 'Elvish sensitivity', 'Dextrous', 'Fashionable'},
    tendencies = { 'fabulous', 'magical', 'spiritual', 'intellectual', 'weak' },
  },

  racial_abilities = { 'Deep Concentration', 'Elvish hearing' },

  military = {
    tradition = 'strong',
    structure = 'hierarchy',
    titles = { 
      officers = {
        { 'Admiral', 'General' }, 
        { 'Commodore', 'Rear Admiral' },
        { 'Captain','Commander' },
        { 'Protector', 'Elder', 'Chief Engineer' },
        { 'Tribute', 'Senior' }
      },
      soldiers = {
        { 'Wind Brother', 'Justicar' },
        { 'Dew soldier', 'Vectikar' },
        { 'Branch Fighter', 'Sprout Justice' },
        { 'Leafling', 'Sproutling' }
      },
      technical = {
        {'Chief Scientist', 'Chief Engineer' },
        {'Scientist', 'Engineer'},
        {'Lab Tech', 'Mechanic'}
      }
    }
  },


  religion = {
    spiritual = true,
    diversity = 'high',
    types = { 'mono','poly','atheism','spiritual', 'magical' },
    themes = {'nature', 'pacifism', 'intellectualism', 'love'},
    major_figures = { {'god', "El'deen"}, {'star', 'Zoon'} }
  },

  politics = {
    forms = { 'aristocracy', 'monarchy', 'republic' },
    traditional = 'monarchy',
    tendency = 'liberalism',
  },

  empires = {
    eldeen = { 
      name = "The El'deen Collective",
      name_short = { "The El'deen", "Collective" },
      age = 'ancient',
      strength = 'powerful',
      economy = 'open market',
    }
  },

  languages = {
    mother_tongue = 'Elvish',
    learns_common = true,
    multi_lingual = 'occasional'
  }
  }
