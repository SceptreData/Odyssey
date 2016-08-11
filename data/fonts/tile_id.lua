-- Should probably just be char_id, oh well. 
-- Should also probably set it up so you can describe a 
-- symbol by typing it in, as well as with a descriptor.

local TileInfo = {}
TileInfo.__self = TileInfo

TileInfo.names = {
  -- Symbols
  'null',
  'face_h',
  'face_s',
  'heart',
  'diamond',
  'club',
  'spade',
  'circle_s',
  'circle_h',
  'oval_s',
  'oval_h',
  'male',
  'female',
  'one_note',
  'two_note',
  'solar',
  'r_tri',
  'l_tri',
  'up_down',
  'two_excl',
  'pilcrow',
  'silcrow',
  'rectangle',
  'up_down_b',
  'up',
  'down',
  'right',
  'left',
  'r_angle',
  'left_right',
  'up_tri',
  'down_tri',
-- 32

  -- Standard punctuation
  'space',
  'excl',
  'quotes',
  'pound',
  'dollar',
  'modulo',
  'amp',
  'apos',
  'l_bracket',
  'r_bracket',
  'asterix',
  'plus',
  'comma',
  'dash',
  'period',
  'f_slash',
-- 48

  -- Numbers
  'num_0',
  'num_1',
  'num_2',
  'num_3',
  'num_4',
  'num_5',
  'num_6',
  'num_7',
  'num_8',
  'num_9',

  -- Mo' Punc
  'colon',
  's_colon',
  'less_than',
  'equals',
  'greater_than',
  'question',
  'hero',
-- 65

  -- Letters, 
  'letter_A',
  'letter_B',
  'letter_C',
  'letter_D',
  'letter_E',
  'letter_F',
  'letter_G',
  'letter_H',
  'letter_I',
  'letter_J',
  'letter_K',
  'letter_L',
  'letter_M',
  'letter_N',
  'letter_O',
  'letter_P',
  'letter_Q',
  'letter_R',
  'letter_S',
  'letter_T',
  'letter_U',
  'letter_V',
  'letter_W',
  'letter_X',
  'letter_Y',
  'letter_Z',
-- 91

  -- symbols
  'l_sbra',
  'b_slash',
  'r_sbra',
  'hat',
  'uscore',
  'tick',
-- 97

  --Underscore Letters
  'letter_a',
  'letter_b',
  'letter_c',
  'letter_d',
  'letter_e',
  'letter_f',
  'letter_g',
  'letter_h',
  'letter_i',
  'letter_j',
  'letter_k',
  'letter_l',
  'letter_m',
  'letter_n',
  'letter_o',
  'letter_p',
  'letter_q',
  'letter_r',
  'letter_s',
  'letter_t',
  'letter_u',
  'letter_v',
  'letter_w',
  'letter_x',
  'letter_y',
  'letter_z',
--123

  -- few symbols
  'l_cbra',
  'pipe',
  'r_cbra',
  'tilde',
  'house',
--128

  -- Special Letters
  'C_beard',
  'umlaut_u',
  'aigu_e',
  'circ_a',
  'umlaut_a',
  'grave_a' ,
  'halo_a',
  'c_beard',
  'circ_e',
  'umlaut_e',
  'grave_e',
  'umlaut_i',
  'circ_i',
  'grave_i',
  'umlaut_A',
  'halo_A',
  'aigu_E',
  'letter_ae',
  'letter_AE',
  'circ_o',
  'umlaut_o',
  'grave_o',
  'circ_u',
  'grave_u',
  'umlaut_y',
  'umlaut_O',
  'umlaut_U',
-- 155

  -- symbols
  'cent',
  'bpound',
  'yen',
  'peso',
-- 159
  
  -- More letters
  'hook_f',
  'aigu_a',
  'aigu_i',
  'aigu_o',
  'aigu_u',
  'tilde_n',
  'tilde_N',
  'ordinal_a',
  'ordinal_o',
--168

  --Symbols
  'inverted_?',
  'l_negate',
  'r_negate',
  'half',
  'quarter',
  'inv_excl_point',
  'l_garrows',
  'r_garrows',
--176

  -- Shade Characters
  'light_shade',
  'medium_shade',
  'heavy_shade',
--179

  -- Box/ Wall drawing chars
  'vert',
  'left_vert',
  'left_double_vert',
  'left_vert_double',
  'left_down_double',
  'left_double_down',
  'left_double_vert_double',
  'vert_double',
  'left_double_down_double',
  'left_double_up_double',
  'left_up_double',
  'left_double_up',
  'left_down',
  'right_up',
  'horiz_up',
  'horiz_down',
  'vert_right',
  'horiz',
  'horiz_ver',
  'right_double_vert',
  'right_vert_double',
  'right_double_up_double',
  'right_double_down_double',
  'horiz_double_up_double',
  'horiz_double_down_double',
  'vert_double_right_double',
  'horiz_double',
  'horiz_double_vert_double',
  'horiz_double_up',
  'horiz_up_double',
  'horiz_double_down',
  'horiz_down_double',
  'right_up_double',
  'right_double_up',
  'right_double_down',
  'right_down_double',
  'horiz_vert_double',
  'horiz_double_vert',
  'left_up',
  'right_down',
  'solid_block', -- 220 (block 2588)
  'half_block_bot',
  'half_block_left',
  'half_block_right',
  'half_block_top',
-- 224

  -- Greek Symbols
  'alpha',
  'beta',
  'gamma',
  'pi',
  'sigma',
  'greek_o1',
  'greek_u',
  'greek_t',
  'tie_fighter',
  'greek_o2',
  'omega',
  'greek_o3',
  'infinite',
  'greek_o4',
  'epsilon',
  'intersect',

  -- Extra Symbols 
  'triple_bar',
  'plus_minus',
  'greater_equal',
  'less_equal',
  'up_hook',
  'down_hook',
  'divide',
  'wave',
  'degree',
  'bullet',
  'dot',
  'sqrt',
  'tiny_n',
  'tiny_2',
  'block_solid',
  'block_hollow'
}


TileInfo.groups = {

  symbols = {
      {1,32}, {92-97},
      {124, 128}, {156, 159},
      {169, 176}, {241, 15}
  },

  punc = {
    {33, 48}, {59, 65}
  },

  nums = {49,58},

  upper_alpha = {66, 91},

  under_alpha = {98, 123},

  extra_alpha= {
    {129, 155}, {160, 168}
  },

  greek_alpha = {225, 240},
    
  shade = {177, 179},

  box_wall = {180, 224}
}
return TileInfo
