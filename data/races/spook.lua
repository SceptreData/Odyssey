local Spook = {
    name = 'Spook',
    plural = 'Spooks',
    base_stats = {
      str = 6,
      dex = 7,
      int = 7,
      speed = 100,
      hp = 15,
      vision = 15,
    },
    creature_type = 'complex',
    disposition = 'friendly',
    genders = {'male', 'female'},
    intelligent = true,
    preferred_weaons = {
        'exlosives',
        'blasters',
        'chainsaw',
    },
    racial_traits = {
        'quick',
        'amicable',
        'small_stature',
        'foodie',
        'delicious',
    },

    starfaring_race = true,
    tech_level = 'advanced',
    ships = {
        'spook_merchant',
        'spook_interceptor',
        'spook_corvette',
        'spook_marauder',
        'spook_battlecruiser'
    }
}
