module Omnibar
  class Emoji < Query

    def result
      return if input.empty?
      "#{key} :: #{value}" if (key and value)
    end

    def self.search
      @fm ||= FuzzyMatch.new(DICTIONARY.keys)
    end

    def key
      search.find(input)
    end

    def value
      DICTIONARY[key]
    end

    def relevance
      input.levenshtein_similar(key)
    end

    def perform!
      copy_to_clipboard DICTIONARY[search.find(input)]
    end

    DICTIONARY = {
      'grinning' => "\u{1f600}",
      'smiley' => "\u{1f603}",
      'smile' => "\u{1f604}",
      'grin' => "\u{1f601}",
      'laughing' => "\u{1f606}",
      'sweat_smile' => "\u{1f605}",
      'joy' => "\u{1f602}",
      'rofl' => "\u{1f923}",
      'relaxed' => "\u{263a}",
      'blush' => "\u{1f60a}",
      'innocent' => "\u{1f607}",
      'slight_smile' => "\u{1f642}",
      'upside_down' => "\u{1f643}",
      'wink' => "\u{1f609}",
      'relieved' => "\u{1f60c}",
      'heart_eyes' => "\u{1f60d}",
      'kissing_heart' => "\u{1f618}",
      'kissing' => "\u{1f617}",
      'kissing_smiling_eyes' => "\u{1f619}",
      'kissing_closed_eyes' => "\u{1f61a}",
      'yum' => "\u{1f60b}",
      'stuck_out_tongue_winking_eye' => "\u{1f61c}",
      'stuck_out_tongue_closed_eyes' => "\u{1f61d}",
      'stuck_out_tongue' => "\u{1f61b}",
      'money_mouth' => "\u{1f911}",
      'hugging' => "\u{1f917}",
      'nerd' => "\u{1f913}",
      'sunglasses' => "\u{1f60e}",
      'clown' => "\u{1f921}",
      'cowboy' => "\u{1f920}",
      'smirk' => "\u{1f60f}",
      'unamused' => "\u{1f612}",
      'disappointed' => "\u{1f61e}",
      'pensive' => "\u{1f614}",
      'worried' => "\u{1f61f}",
      'confused' => "\u{1f615}",
      'slight_frown' => "\u{1f641}",
      'frowning2' => "\u{2639}",
      'persevere' => "\u{1f623}",
      'confounded' => "\u{1f616}",
      'tired_face' => "\u{1f62b}",
      'weary' => "\u{1f629}",
      'triumph' => "\u{1f624}",
      'angry' => "\u{1f620}",
      'rage' => "\u{1f621}",
      'no_mouth' => "\u{1f636}",
      'neutral_face' => "\u{1f610}",
      'expressionless' => "\u{1f611}",
      'hushed' => "\u{1f62f}",
      'frowning' => "\u{1f626}",
      'anguished' => "\u{1f627}",
      'open_mouth' => "\u{1f62e}",
      'astonished' => "\u{1f632}",
      'dizzy_face' => "\u{1f635}",
      'flushed' => "\u{1f633}",
      'scream' => "\u{1f631}",
      'fearful' => "\u{1f628}",
      'cold_sweat' => "\u{1f630}",
      'cry' => "\u{1f622}",
      'disappointed_relieved' => "\u{1f625}",
      'drooling_face' => "\u{1f924}",
      'sob' => "\u{1f62d}",
      'sweat' => "\u{1f613}",
      'sleepy' => "\u{1f62a}",
      'sleeping' => "\u{1f634}",
      'rolling_eyes' => "\u{1f644}",
      'thinking' => "\u{1f914}",
      'lying_face' => "\u{1f925}",
      'grimacing' => "\u{1f62c}",
      'zipper_mouth' => "\u{1f910}",
      'nauseated_face' => "\u{1f922}",
      'sneezing_face' => "\u{1f927}",
      'mask' => "\u{1f637}",
      'thermometer_face' => "\u{1f912}",
      'head_bandage' => "\u{1f915}",
      'smiling_imp' => "\u{1f608}",
      'imp' => "\u{1f47f}",
      'japanese_ogre' => "\u{1f479}",
      'japanese_goblin' => "\u{1f47a}",
      'poop' => "\u{1f4a9}",
      'ghost' => "\u{1f47b}",
      'skull' => "\u{1f480}",
      'skull_crossbones' => "\u{2620}",
      'alien' => "\u{1f47d}",
      'space_invader' => "\u{1f47e}",
      'robot' => "\u{1f916}",
      'jack_o_lantern' => "\u{1f383}",
      'smiley_cat' => "\u{1f63a}",
      'smile_cat' => "\u{1f638}",
      'joy_cat' => "\u{1f639}",
      'heart_eyes_cat' => "\u{1f63b}",
      'smirk_cat' => "\u{1f63c}",
      'kissing_cat' => "\u{1f63d}",
      'scream_cat' => "\u{1f640}",
      'crying_cat_face' => "\u{1f63f}",
      'pouting_cat' => "\u{1f63e}",
      'open_hands' => "\u{1f450}",
      'raised_hands' => "\u{1f64c}",
      'clap' => "\u{1f44f}",
      'pray' => "\u{1f64f}",
      'handshake' => "\u{1f91d}",
      'thumbsup' => "\u{1f44d}",
      'thumbsdown' => "\u{1f44e}",
      'punch' => "\u{1f44a}",
      'fist' => "\u{270a}",
      'left_facing_fist' => "\u{1f91b}",
      'right_facing_fist' => "\u{1f91c}",
      'fingers_crossed' => "\u{1f91e}",
      'v' => "\u{270c}",
      'metal' => "\u{1f918}",
      'ok_hand' => "\u{1f44c}",
      'point_left' => "\u{1f448}",
      'point_right' => "\u{1f449}",
      'point_up_2' => "\u{1f446}",
      'point_down' => "\u{1f447}",
      'point_up' => "\u{261d}",
      'raised_hand' => "\u{270b}",
      'raised_back_of_hand' => "\u{1f91a}",
      'hand_splayed' => "\u{1f590}",
      'vulcan' => "\u{1f596}",
      'wave' => "\u{1f44b}",
      'call_me' => "\u{1f919}",
      'muscle' => "\u{1f4aa}",
      'middle_finger' => "\u{1f595}",
      'writing_hand' => "\u{270d}",
      'selfie' => "\u{1f933}",
      'nail_care' => "\u{1f485}",
      'ring' => "\u{1f48d}",
      'lipstick' => "\u{1f484}",
      'kiss' => "\u{1f48b}",
      'lips' => "\u{1f444}",
      'tongue' => "\u{1f445}",
      'ear' => "\u{1f442}",
      'nose' => "\u{1f443}",
      'footprints' => "\u{1f463}",
      'eye' => "\u{1f441}",
      'eyes' => "\u{1f440}",
      'speaking_head' => "\u{1f5e3}",
      'bust_in_silhouette' => "\u{1f464}",
      'busts_in_silhouette' => "\u{1f465}",
      'baby' => "\u{1f476}",
      'boy' => "\u{1f466}",
      'girl' => "\u{1f467}",
      'man' => "\u{1f468}",
      'woman' => "\u{1f469}",
      'blond haired_woman' => "\u{1f471 2640}",
      'blond_haired_person' => "\u{1f471}",
      'older_man' => "\u{1f474}",
      'older_woman' => "\u{1f475}",
      'man_with_chinese_cap' => "\u{1f472}",
      'woman_wearing_turban' => "\u{1f473 2640}",
      'person_wearing_turban' => "\u{1f473}",
      'woman_police_officer' => "\u{1f46e 2640}",
      'police_officer' => "\u{1f46e}",
      'woman_construction_worker' => "\u{1f477 2640}",
      'construction_worker' => "\u{1f477}",
      'woman_guard' => "\u{1f482 2640}",
      'guard' => "\u{1f482}",
      'woman_detective' => "\u{1f575 2640}",
      'detective' => "\u{1f575}",
      'woman_health_worker' => "\u{1f469 2695}",
      'man_health_worker' => "\u{1f468 2695}",
      'woman_farmer' => "\u{1f469 1f33e}",
      'man_farmer' => "\u{1f468 1f33e}",
      'woman_cook' => "\u{1f469 1f373}",
      'man_cook' => "\u{1f468 1f373}",
      'woman_student' => "\u{1f469 1f393}",
      'man_student' => "\u{1f468 1f393}",
      'woman_singer' => "\u{1f469 1f3a4}",
      'man_singer' => "\u{1f468 1f3a4}",
      'woman_teacher' => "\u{1f469 1f3eb}",
      'man_teacher' => "\u{1f468 1f3eb}",
      'woman_factory_worker' => "\u{1f469 1f3ed}",
      'man_factory_worker' => "\u{1f468 1f3ed}",
      'woman_technologist' => "\u{1f469 1f4bb}",
      'man_technologist' => "\u{1f468 1f4bb}",
      'woman_office_worker' => "\u{1f469 1f4bc}",
      'man_office_worker' => "\u{1f468 1f4bc}",
      'woman_mechanic' => "\u{1f469 1f527}",
      'man_mechanic' => "\u{1f468 1f527}",
      'woman_scientist' => "\u{1f469 1f52c}",
      'man_scientist' => "\u{1f468 1f52c}",
      'woman_artist' => "\u{1f469 1f3a8}",
      'man_artist' => "\u{1f468 1f3a8}",
      'woman_firefighter' => "\u{1f469 1f692}",
      'man_firefighter' => "\u{1f468 1f692}",
      'woman_pilot' => "\u{1f469 2708}",
      'man_pilot' => "\u{1f468 2708}",
      'woman_astronaut' => "\u{1f469 1f680}",
      'man_astronaut' => "\u{1f468 1f680}",
      'woman_judge' => "\u{1f469 2696}",
      'man_judge' => "\u{1f468 2696}",
      'mrs_claus' => "\u{1f936}",
      'santa' => "\u{1f385}",
      'princess' => "\u{1f478}",
      'prince' => "\u{1f934}",
      'bride_with_veil' => "\u{1f470}",
      'man_in_tuxedo' => "\u{1f935}",
      'angel' => "\u{1f47c}",
      'pregnant_woman' => "\u{1f930}",
      'woman_bowing' => "\u{1f647 2640}",
      'person_bowing' => "\u{1f647}",
      'person_tipping_hand' => "\u{1f481}",
      'man_tipping_hand' => "\u{1f481 2642}",
      'person_gesturing_no' => "\u{1f645}",
      'man_gesturing_no' => "\u{1f645 2642}",
      'person_gesturing_ok' => "\u{1f646}",
      'man_gesturing_ok' => "\u{1f646 2642}",
      'person_raising_hand' => "\u{1f64b}",
      'man_raising_hand' => "\u{1f64b 2642}",
      'woman_facepalming' => "\u{1f926 2640}",
      'man_facepalming' => "\u{1f926 2642}",
      'woman_shrugging' => "\u{1f937 2640}",
      'man_shrugging' => "\u{1f937 2642}",
      'person_pouting' => "\u{1f64e}",
      'man_pouting' => "\u{1f64e 2642}",
      'person_frowning' => "\u{1f64d}",
      'man_frowning' => "\u{1f64d 2642}",
      'person_getting_haircut' => "\u{1f487}",
      'man_getting_haircut' => "\u{1f487 2642}",
      'person_getting_massage' => "\u{1f486}",
      'man_getting_face_massage' => "\u{1f486 2642}",
      'levitate' => "\u{1f574}",
      'dancer' => "\u{1f483}",
      'man_dancing' => "\u{1f57a}",
      'people_with_bunny_ears_partying' => "\u{1f46f}",
      'men_with_bunny_ears_partying' => "\u{1f46f 2642}",
      'woman_walking' => "\u{1f6b6 2640}",
      'person_walking' => "\u{1f6b6}",
      'woman_running' => "\u{1f3c3 2640}",
      'person_running' => "\u{1f3c3}",
      'couple' => "\u{1f46b}",
      'two_women_holding_hands' => "\u{1f46d}",
      'two_men_holding_hands' => "\u{1f46c}",
      'couple_with_heart' => "\u{1f491}",
      'couple_ww' => "\u{1f469 2764 1f469}",
      'couple_mm' => "\u{1f468 2764 1f468}",
      'couplekiss' => "\u{1f48f}",
      'kiss_ww' => "\u{1f469 2764 1f48b 1f469}",
      'kiss_mm' => "\u{1f468 2764 1f48b 1f468}",
      'family' => "\u{1f46a}",
      'family_mwg' => "\u{1f468 1f469 1f467}",
      'family_mwgb' => "\u{1f468 1f469 1f467 1f466}",
      'family_mwbb' => "\u{1f468 1f469 1f466 1f466}",
      'family_mwgg' => "\u{1f468 1f469 1f467 1f467}",
      'family_wwb' => "\u{1f469 1f469 1f466}",
      'family_wwg' => "\u{1f469 1f469 1f467}",
      'family_wwgb' => "\u{1f469 1f469 1f467 1f466}",
      'family_wwbb' => "\u{1f469 1f469 1f466 1f466}",
      'family_wwgg' => "\u{1f469 1f469 1f467 1f467}",
      'family_mmb' => "\u{1f468 1f468 1f466}",
      'family_mmg' => "\u{1f468 1f468 1f467}",
      'family_mmgb' => "\u{1f468 1f468 1f467 1f466}",
      'family_mmbb' => "\u{1f468 1f468 1f466 1f466}",
      'family_mmgg' => "\u{1f468 1f468 1f467 1f467}",
      'family_woman_boy' => "\u{1f469 1f466}",
      'family_woman_girl' => "\u{1f469 1f467}",
      'family_woman_girl_boy' => "\u{1f469 1f467 1f466}",
      'family_woman_boy_boy' => "\u{1f469 1f466 1f466}",
      'family_woman_girl_girl' => "\u{1f469 1f467 1f467}",
      'family_man_boy' => "\u{1f468 1f466}",
      'family_man_girl' => "\u{1f468 1f467}",
      'family_man_girl_boy' => "\u{1f468 1f467 1f466}",
      'family_man_boy_boy' => "\u{1f468 1f466 1f466}",
      'family_man_girl_girl' => "\u{1f468 1f467 1f467}",
      'womans_clothes' => "\u{1f45a}",
      'shirt' => "\u{1f455}",
      'jeans' => "\u{1f456}",
      'necktie' => "\u{1f454}",
      'dress' => "\u{1f457}",
      'bikini' => "\u{1f459}",
      'kimono' => "\u{1f458}",
      'high_heel' => "\u{1f460}",
      'sandal' => "\u{1f461}",
      'boot' => "\u{1f462}",
      'mans_shoe' => "\u{1f45e}",
      'athletic_shoe' => "\u{1f45f}",
      'womans_hat' => "\u{1f452}",
      'tophat' => "\u{1f3a9}",
      'mortar_board' => "\u{1f393}",
      'crown' => "\u{1f451}",
      'helmet_with_cross' => "\u{26d1}",
      'school_satchel' => "\u{1f392}",
      'pouch' => "\u{1f45d}",
      'purse' => "\u{1f45b}",
      'handbag' => "\u{1f45c}",
      'briefcase' => "\u{1f4bc}",
      'eyeglasses' => "\u{1f453}",
      'dark_sunglasses' => "\u{1f576}",
      'closed_umbrella' => "\u{1f302}",
      'umbrella2' => "\u{2602}",
      'face_with_raised_eyebrow' => "\u{1f928}",
      'star_struck' => "\u{1f929}",
      'crazy_face' => "\u{1f92a}",
      'shushing_face' => "\u{1f92b}",
      'face_with_symbols_over_mouth' => "\u{1f92c}",
      'face_with_hand_over_mouth' => "\u{1f92d}",
      'face_vomiting' => "\u{1f92e}",
      'exploding_head' => "\u{1f92f}",
      'face_with_monocle' => "\u{1f9d0}",
      'adult' => "\u{1f9d1}",
      'child' => "\u{1f9d2}",
      'older_adult' => "\u{1f9d3}",
      'bearded_person' => "\u{1f9d4}",
      'woman_with_headscarf' => "\u{1f9d5}",
      'brain' => "\u{1f9e0}",
      'billed_cap' => "\u{1f9e2}",
      'scarf' => "\u{1f9e3}",
      'gloves' => "\u{1f9e4}",
      'coat' => "\u{1f9e5}",
      'socks' => "\u{1f9e6}",
      'love_you_gesture' => "\u{1f91f}",
      'palms_up_together' => "\u{1f932}",
      'woman_mage' => "\u{1f9d9 2640}",
      'man_mage' => "\u{1f9d9 2642}",
      'woman_fairy' => "\u{1f9da 2640}",
      'man_fairy' => "\u{1f9da 2642}",
      'woman_vampire' => "\u{1f9db 2640}",
      'man_vampire' => "\u{1f9db 2642}",
      'mermaid' => "\u{1f9dc 2640}",
      'merman' => "\u{1f9dc 2642}",
      'woman_elf' => "\u{1f9dd 2640}",
      'man_elf' => "\u{1f9dd 2642}",
      'woman_genie' => "\u{1f9de 2640}",
      'man_genie' => "\u{1f9de 2642}",
      'woman_zombie' => "\u{1f9df 2640}",
      'man_zombie' => "\u{1f9df 2642}"
    }.freeze
  end
end
