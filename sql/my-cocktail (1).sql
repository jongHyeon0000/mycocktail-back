CREATE TABLE `base_spirits` (
    `base_spirits_id` INT NOT NULL AUTO_INCREMENT COMMENT '기주',
    `spirit_type` VARCHAR(50) NOT NULL COMMENT '기주 종류',
    `spirit_type_kr` VARCHAR(100) NOT NULL COMMENT '기주 종류(한글)',
    `default_abv` DECIMAL(3,1) NOT NULL COMMENT '평균 도수',
    `notes` TEXT NOT NULL COMMENT '설명',
    `history_notes` TEXT NOT NULL COMMENT '역사 설명',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일'
) COMMENT '기주';

CREATE TABLE `cocktail_variations` (
    `cocktail_variation_id` INT NOT NULL AUTO_INCREMENT COMMENT '변형 칵테일 레시피',
    `original_cocktail_id` INT NOT NULL COMMENT '원본 칵테일 fk',
    `variation_cocktail_id` INT NOT NULL COMMENT '변형 칵테일 fk',
    `notes` TEXT NOT NULL COMMENT '설명',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '생성일'
) COMMENT '변형 칵테일 레시피';

CREATE TABLE `garnishes` (
   `garnish_id` INT NOT NULL AUTO_INCREMENT COMMENT '가니쉬',
   `brand_id` INT NOT NULL COMMENT '브랜드 id',
   `country_id` INT NOT NULL COMMENT '원산지 국가 id',
   `garnish_name` VARCHAR(50) NOT NULL COMMENT '가니쉬명',
   `garnish_name_kr` VARCHAR(100) NOT NULL COMMENT '가니쉬명(한글)',
   `notes` TEXT NULL COMMENT '설명',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `storage_type` VARCHAR(100) NULL COMMENT '보관방법',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
   `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NOT NULL COMMENT '대체 가능한 것에 대한 설명',
   `garnish_type` ENUM('citrus', 'herb', 'fruit', 'vegetable', 'other') NOT NULL COMMENT '타입',
   `primary_function` ENUM('aroma', 'flavor', 'visual', 'all') NOT NULL COMMENT '주요 사용처'
) COMMENT '가니쉬';

CREATE TABLE `tools` (
    `tool_id` INT NOT NULL AUTO_INCREMENT COMMENT '기물명',
    `tool_name` VARCHAR(50) NOT NULL COMMENT '기물명(영문)',
    `tool_name_kr` VARCHAR(100) NOT NULL COMMENT '기물명(한글)',
    `tool_category` ENUM('shaker', 'strainer', 'measuring', 'mixing', 'muddling', 'garnish', 'other') NOT NULL COMMENT '기물 분류',
    `material` VARCHAR(100) NOT NULL COMMENT '재질',
    `notes` TEXT NULL COMMENT '설명',
    `when_to_use_notes` TEXT NULL COMMENT '사용 시기에 대한 설명',
    `recommended_products` TEXT NULL COMMENT '추천 제품',
    `alternative_tools` TEXT NULL COMMENT '대체 가능한 도구',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일'
) COMMENT '도구/기물';

CREATE TABLE `cocktail_garnishes` (
   `cocktail_garnished_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 가니쉬',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 id',
   `garnish_id` INT NOT NULL COMMENT '가니쉬 id',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 가니쉬';

CREATE TABLE `carbonated_integredients` (
    `carbonated_integredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
    `integredient_id` INT NOT NULL COMMENT '주재료 fk',
    `carbonated_id` INT NOT NULL COMMENT '탄산/소다 fk',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '탄산/소다 주재료';

CREATE TABLE `bitters` (
   `bitter_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `bitter_name` VARCHAR(50) NOT NULL COMMENT '비터스명',
   `bitter_name_kr` VARCHAR(100) NOT NULL COMMENT '비터스명(한글)',
   `abv` DECIMAL(3,1) NOT NULL COMMENT '도수',
   `notes` TEXT NULL COMMENT '설명',
   `storage_type` VARCHAR(100) NULL COMMENT '보관방법',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
   `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명'
) COMMENT '비터스';

CREATE TABLE `other_ingredient_integredients` (
   `other_ingredient_integredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `other_ingredient_id` INT NOT NULL COMMENT 'id',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '기타 첨가물 주재료';

CREATE TABLE `syrup_integredients` (
   `syrup_integredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `syrups_id` INT NOT NULL COMMENT '시럽 fk',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '시럽 주재료';

CREATE TABLE `cocktail_spirit_products` (
   `cocktail_spirit_product_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 주류',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `spirit_products_id` INT NOT NULL COMMENT '기주 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 기주';

CREATE TABLE `cocktail_glassware` (
   `cocktail_glassware_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 글라스',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `glass_id` INT NOT NULL COMMENT '서빙 잔 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 서빙 잔';

CREATE TABLE `other_ingredients` (
   `other_ingredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `other_ingredient_name` VARCHAR(50) NOT NULL COMMENT '기타 첨가물명',
   `other_ingredient_name_kr` VARCHAR(100) NOT NULL COMMENT '기타 첨가물명(한글)',
   `notes` TEXT NULL COMMENT '설명',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `storage_type` VARCHAR(100) NULL COMMENT '보관방법',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
   `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명',
   `ingredient_category` ENUM('egg', 'spice', 'sauce', 'sweetener', 'other') NOT NULL COMMENT '타입',
   `primary_function` ENUM('foam', 'rim', 'flavor', 'enhancer', 'other') NOT NULL COMMENT '주요 사용처'
) COMMENT '기타 첨가물';

CREATE TABLE `users` (
   `user_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `email` VARCHAR(255) NOT NULL COMMENT '이메일',
   `password` VARCHAR(255) NOT NULL COMMENT '패스워드',
   `is_active` BOOLEAN NOT NULL COMMENT '활성 여부',
   `is_deleted` BOOLEAN NOT NULL COMMENT '탈퇴 여부',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '가입일',
   `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일',
   `deactive_at` TIMESTAMP NOT NULL COMMENT '비활성 업데이트일',
   `deleted_at` TIMESTAMP NULL COMMENT '탈퇴 업데이트일',
   `username` VARCHAR(50) NOT NULL COMMENT '유저명',
   `gender` CHAR(1) NULL COMMENT '성별',
   `birth_date` DATE NULL COMMENT '생일',
   `profile_notes` TEXT NULL COMMENT '자기소개'
) COMMENT '유저계정';

CREATE TABLE `cocktail_bitters` (
   `cocktail_bitter_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 비터스',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `bitter_id` INT NOT NULL COMMENT '비터스 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 비터스';

CREATE TABLE `technique_tools` (
   `technique_tool_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `technique_id` INT NOT NULL COMMENT '제조 기법 fk',
   `tool_id` INT NOT NULL COMMENT '도구/기물 fk',
   `is_substitutable` BOOLEAN NOT NULL COMMENT '대체 가능 여부',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
   `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 업데이트일'
) COMMENT '기법/기물 매핑';

CREATE TABLE `image_thumbnails` (
   `image_thumbnails_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `image_id` INT NOT NULL COMMENT '원본 이미지 fk',
   `width` INT NOT NULL COMMENT '썸네일 이미지 너비',
   `height` INT NOT NULL COMMENT '썸네일 이미지 높이',
   `file_path` VARCHAR(255) NOT NULL COMMENT '썸네일 이미지 경로',
   `file_size` INT NOT NULL COMMENT '썸네일 이미지 크기',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '이미지 썸네일';

CREATE TABLE `garnish_integredients` (
   `garnish_integredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `garnish_id` INT NOT NULL COMMENT '가니쉬 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '가니쉬 주재료';

CREATE TABLE `bitter_integredients` (
   `bitter_integredient_id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
   `bitter_id` INT NOT NULL COMMENT '비터스 fk',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '비터스 주재료';

CREATE TABLE `cocktail_serving_style` (
   `cocktail_serving_style_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 서빙 스타일',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `serving_style_id` INT NOT NULL COMMENT '서빙 스타일 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 서빙 스타일';

CREATE TABLE `cocktail_juices` (
   `cocktail_juice_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 주스',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `juice_id` INT NOT NULL COMMENT '주스 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 주스';

CREATE TABLE `dairy_cream` (
	`dairy_id` INT NOT NULL COMMENT 'id',
	`brand_id` INT NOT NULL COMMENT '브랜드 fk',
	`country_id` INT NOT NULL COMMENT '원산지 국가 fk',
	`dairy_name` VARCHAR(50) NOT NULL COMMENT '유제품/크림명',
	`dairy_name_kr` VARCHAR(100) NOT NULL COMMENT '유제품/크림명(한글)',
	`fat_content` DECIMAL(3,1) NULL COMMENT '지방 함량',
	`notes` TEXT NULL COMMENT '설명',
	`shelf_life_days` INT NULL COMMENT '유통기한',
	`storage_type` VARCHAR(100) NULL COMMENT '보관방법',
	`personal_review` TEXT NULL COMMENT '개인 후기',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
	`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
	`substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명',
	`dairy_type` ENUM('milk', 'cream', 'coconut', 'alternative') NOT NULL COMMENT '타입',
	`is_dairy_free` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '유제품 프리 여부'
) COMMENT '유제품/크림류';

CREATE TABLE `country` (
	`country_id` INT NOT NULL COMMENT 'id',
	`country` VARCHAR(50) NOT NULL COMMENT '원산지 국가',
	`country_name` VARCHAR(100) NOT NULL COMMENT '원산지 국가(한글)',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
	`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '원산지 국가';

CREATE TABLE `cocktail_syrups` (
   `cocktail_syrup_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 시럽',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `syrups_id` INT NOT NULL COMMENT '시럽 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 시럽';

CREATE TABLE `brand` (
   `brand_id` INT NOT NULL COMMENT 'id',
   `brand` VARCHAR(50) NOT NULL COMMENT '브랜드명',
   `brand_kr` VARCHAR(100) NOT NULL COMMENT '브랜드명(한글)',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `notes` TEXT NULL COMMENT '설명',
   `history_notes` TEXT NULL COMMENT '역사 설명'
) COMMENT '브랜드';

CREATE TABLE `user_recipe_likes` (
   `user_recipe_like_id` INT NOT NULL COMMENT 'id',
   `user_id` INT NOT NULL COMMENT '유저 fk',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
) COMMENT '유저 좋아요 레시피 목록';

CREATE TABLE `cocktail_dairy_cream` (
   `cocktail_dairy_cream_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 유제품/크림',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `dairy_id` INT NOT NULL COMMENT '유제품 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 유제품/크림';

CREATE TABLE `carbonated` (
   `carbonated_id` INT NOT NULL COMMENT 'id',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `carbonated_name` VARCHAR(50) NOT NULL COMMENT '탄산/소다명',
   `carbonated_name_kr` VARCHAR(100) NOT NULL COMMENT '탄산/소다명(한글)',
   `sugar_level` INT NOT NULL COMMENT '당도 (1~5)',
   `notes` TEXT NULL COMMENT '설명',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `storage_type` VARCHAR(100) NULL COMMENT '보관방법',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명',
   `carbonated_type` ENUM('soda', 'tonic', 'ginger', 'cola', 'other') NOT NULL COMMENT '타입'
) COMMENT '탄산/소다류';

CREATE TABLE `syrups` (
   `syrups_id` INT NOT NULL COMMENT 'id',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `syrups_name` VARCHAR(50) NOT NULL COMMENT '시럽명',
   `syrups_name_kr` VARCHAR(100) NOT NULL COMMENT '시럽명(한글)',
   `sugar_content` DECIMAL(3,1) NOT NULL COMMENT '당도',
   `notes` TEXT NULL COMMENT '설명',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `storage_type` VARCHAR(100) NULL COMMENT '보관방법',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명'
) COMMENT '시럽';

CREATE TABLE `integredients` (
   `integredient_id` INT NOT NULL COMMENT 'id',
   `integredient_name` VARCHAR(50) NOT NULL COMMENT '주재료명',
   `integredient_name_kr` VARCHAR(100) NOT NULL COMMENT '주재료명(한글)',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `notes` TEXT NULL COMMENT '설명'
) COMMENT '주재료';

CREATE TABLE `techniques` (
   `technique_id` INT NOT NULL COMMENT 'id',
   `technique_name` VARCHAR(50) NOT NULL COMMENT '기법명',
   `technique_name_kr` VARCHAR(100) NOT NULL COMMENT '기법명(한글)',
   `technique_category` ENUM('mix', 'pour', 'garnish', 'special') NOT NULL COMMENT '타입',
   `notes` TEXT NULL COMMENT '설명',
   `when_to_use_notes` TEXT NULL COMMENT '사용 시기에 대한 설명',
   `dilution_level` ENUM('none', 'low', 'medium', 'high') NOT NULL COMMENT '희석 정도',
   `aeration_level` ENUM('none', 'low', 'medium', 'high') NOT NULL COMMENT '공기 주입 정도',
   `temperature_change` ENUM('none', 'chill', 'warm') NOT NULL COMMENT '온도 변화',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '제조 기법';

CREATE TABLE `user_recipes` (
   `user_recipe_id` INT NOT NULL COMMENT 'id',
   `user_id` INT NOT NULL COMMENT '유저 fk',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
) COMMENT '유저 레시피 목록';

CREATE TABLE `cocktail_sources` (
   `cocktail_source_id` INT NOT NULL COMMENT 'id',
   `source_code` VARCHAR(20) NULL COMMENT '코드',
   `source_name` VARCHAR(50) NOT NULL COMMENT '전체명',
   `source_name_kr` VARCHAR(100) NOT NULL COMMENT '전체명(한글)',
   `established_year` INT NULL COMMENT '설립/출판 연도',
   `country` VARCHAR(50) NULL COMMENT '설립 or 관리 국가',
   `website_url` VARCHAR(255) NULL COMMENT '웹사이트 url',
   `notes` TEXT NULL COMMENT '설명',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `is_official` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '공식 여부'
) COMMENT '제조 기법 출처';

CREATE TABLE `cocktails` (
   `cocktail_id` INT NOT NULL COMMENT 'id',
   `cocktail_source_id` INT NOT NULL COMMENT '제조 기법 출처 fk',
   `user_id` INT NOT NULL COMMENT '등록 유저 id',
   `cocktail_name` VARCHAR(50) NOT NULL COMMENT '칵테일명',
   `cocktail_name_kr` VARCHAR(100) NOT NULL COMMENT '칵테일명(한글)',
   `url_slug` VARCHAR(100) NULL COMMENT 'URL 슬러그',
   `category` ENUM('classic', 'contemporary', 'signature', 'mocktail', 'other') NOT NULL COMMENT '카테고리',
   `abs_percentage` DECIMAL(3,1) NOT NULL COMMENT '예상 도수',
   `serving_size_ml` INT NOT NULL COMMENT '표준 제공량',
   `defficulty_level` INT NOT NULL COMMENT '난이도 (1~5)',
   `profile_note` TEXT NULL COMMENT '프로필 설명',
   `note` TEXT NULL COMMENT '설명',
   `history_note` TEXT NULL COMMENT '역사 설명',
   `tip_note` TEXT NULL COMMENT '제조 팁',
   `view_count` INT NOT NULL DEFAULT 0 COMMENT '조회수',
   `like_count` INT NOT NULL DEFAULT 0 COMMENT '좋아요 수',
   `share_count` INT NOT NULL DEFAULT 0 COMMENT '공유된 수',
   `is_variation` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '변형 레시피 여부',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `personal_notes` TEXT NULL COMMENT '개인적인 설명',
   `maker_tips` TEXT NULL COMMENT '개인적인 팁',
   `personal_review` TEXT NULL COMMENT '개인적인 후기',
   `is_active` BOOLEAN NOT NULL DEFAULT TRUE COMMENT '활성 여부'
) COMMENT '칵테일';

CREATE TABLE `cocktail_carbonated` (
   `cocktail_carbonated` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 탄산/소다류류',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `carbonated_id` INT NOT NULL COMMENT '탄산/소다류 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 탄산/소다류류';

CREATE TABLE `glassware_serving_style` (
   `glassware_serving_style_id` INT NOT NULL COMMENT 'id',
   `glass_id` INT NOT NULL COMMENT '서빙 잔 fk',
   `serving_style_id` INT NOT NULL COMMENT '서빙 스타일 fk',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일'
) COMMENT '자주 사용되는 서빙 스타일';

CREATE TABLE `juice_integredients` (
   `juice_integredient_id` INT NOT NULL COMMENT 'id',
   `juice_id` INT NOT NULL COMMENT '주스 fk',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일'
) COMMENT '주스 주재료';

CREATE TABLE `dairy_cream_integredients` (
   `dairy_cream_integredient_id` INT NOT NULL COMMENT 'id',
   `integredient_id` INT NOT NULL COMMENT '주재료 fk',
   `dairy_id` INT NOT NULL COMMENT '유제품/크림 fk',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일'
) COMMENT '유제품/크림류 주재료';

CREATE TABLE `cocktail_other_ingredients` (
   `cocktail_other_ingredient_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 기타 첨가물',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `other_ingredient_id` INT NOT NULL COMMENT '기타 첨가물 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 기타 첨가물';

CREATE TABLE `juices` (
   `juice_id` INT NOT NULL COMMENT 'id',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `juice_name` VARCHAR(50) NOT NULL COMMENT '주스명',
   `juice_name_kr` VARCHAR(100) NOT NULL COMMENT '주스명(한글)',
   `sugar_level` INT NOT NULL COMMENT '당도 (1~5)',
   `acidity_level` INT NOT NULL COMMENT '산도 (1~5)',
   `notes` TEXT NULL COMMENT '설명',
   `storage_type` TEXT NULL COMMENT '보관방법',
   `shelf_life_days` INT NULL COMMENT '유통기한',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일',
   `substitute_notes` TEXT NULL COMMENT '대체 가능한 것에 대한 설명',
   `juice_type` ENUM('citrus', 'tropical', 'berry', 'other') NOT NULL COMMENT '타입'
) COMMENT '주스';

CREATE TABLE `cocktail_techniques` (
   `cocktail_technique_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 제조 기법',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `technique_id` INT NOT NULL COMMENT '제조 기법 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 제조 기법';

CREATE TABLE `cocktail_tools` (
   `cocktail_tool_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 사용 도구/기물',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `tool_id` INT NOT NULL COMMENT '도구 fk',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 사용 도구/기물';

CREATE TABLE `cocktail_hashtags` (
   `cocktail_hashtag_id` INT NOT NULL AUTO_INCREMENT COMMENT '칵테일 해시태그',
   `cocktail_id` INT NOT NULL COMMENT '칵테일 fk',
   `cocktail_hashtag` VARCHAR(50) NOT NULL COMMENT '해시태그',
   `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일'
) COMMENT '칵테일 해시태그';

CREATE TABLE `images` (
   `image_id` INT NOT NULL COMMENT 'id',
   `user_id` INT NOT NULL COMMENT '등록 유저 fk',
   `file_name` VARCHAR(255) NOT NULL COMMENT '원본 파일명',
   `file_path` VARCHAR(255) NOT NULL COMMENT '이미지 경로',
   `file_size` INT NOT NULL COMMENT '이미지 파일 크기',
   `mime_type` VARCHAR(50) NOT NULL COMMENT '이미지 MIME 타입',
   `width` INT NOT NULL COMMENT '이미지 너비',
   `height` INT NOT NULL COMMENT '이미지 높이',
   `entity_type` ENUM('cocktail', 'spirit', 'brand', 'glass', 'user') NOT NULL COMMENT '연동 테이블 엔티티',
   `alt` VARCHAR(255) NULL COMMENT '대체 텍스트',
   `display_order` INT NOT NULL DEFAULT 0 COMMENT '이미지 표시 순서',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일'
) COMMENT '이미지';

CREATE TABLE `spirit_products` (
   `spirit_products_id` INT NOT NULL COMMENT 'id',
   `base_sprits_id` INT NOT NULL COMMENT '기주 fk',
   `country_id` INT NOT NULL COMMENT '원산지 국가 fk',
   `brand_id` INT NOT NULL COMMENT '브랜드 fk',
   `spirit_name` VARCHAR(50) NOT NULL COMMENT '제품명',
   `spirit_name_kr` VARCHAR(100) NOT NULL COMMENT '제품명(한글)',
   `abv` DECIMAL(3,1) NOT NULL COMMENT '도수',
   `volume_ml` INT NOT NULL COMMENT '용량(ml)',
   `sweetness` INT NULL COMMENT '단맛 레벨 (1~5)',
   `citrus` INT NULL COMMENT '시트러스 레벨(1~5)',
   `herbal` INT NULL COMMENT '허브(1~5)',
   `spicy` INT NULL COMMENT '매움(1~5)',
   `price` INT NOT NULL COMMENT '가격',
   `price_updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가격 업데이트일',
   `integredients` TEXT NULL COMMENT '주재료',
   `notes` TEXT NULL COMMENT '설명',
   `profile_note` TEXT NULL COMMENT '프로필 설명',
   `history_notes` TEXT NULL COMMENT '역사 설명',
   `personal_review` TEXT NULL COMMENT '개인 후기',
   `is_discontinued` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '단종여부',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '개별 기주';

CREATE TABLE `comments` (
   `comment_id` INT NOT NULL COMMENT 'id',
   `user_id` INT NOT NULL COMMENT '작성자 fk',
   `cocktail_id` INT NOT NULL COMMENT '레시피 fk',
   `parent_comment_id` INT NULL COMMENT '부모 댓글 key',
   `content` TEXT NULL COMMENT '내용',
   `depth` INT NULL COMMENT '순서',
   `is_child_comment` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '답글 여부',
   `sort_order` INT NOT NULL DEFAULT 0 COMMENT '답글인 경우 순서',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '댓글/답글';

CREATE TABLE `serving_style` (
   `serving_style_id` INT NOT NULL COMMENT 'id',
   `serving_style_name` VARCHAR(50) NOT NULL COMMENT '서빙 스타일명',
   `serving_style_name_kr` VARCHAR(100) NOT NULL COMMENT '서빙 스타일명(한글)',
   `note` TEXT NULL COMMENT '설명',
   `serving_tips` TEXT NULL COMMENT '주의사항',
   `temperature` ENUM('cold', 'room', 'hot') NOT NULL COMMENT '평균 온도',
   `has_ice` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '얼음 포함 여부',
   `is_strained` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '스트레인 여부',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '서빙 스타일';

CREATE TABLE `glassware` (
   `glass_id` INT NOT NULL COMMENT 'id',
   `glass_name` VARCHAR(50) NOT NULL COMMENT '서빙 잔명',
   `glass_name_kr` VARCHAR(100) NOT NULL COMMENT '서빙 잔명(한글)',
   `glass_type` ENUM('stemmed', 'tumbler', 'mug', 'flute', 'specialty') NOT NULL COMMENT '타입',
   `notes` TEXT NULL COMMENT '설명',
   `primary_purpose` TEXT NOT NULL COMMENT '주요 목적 설명',
   `serving_style` ENUM('straight_up', 'on_the_rocks', 'neat', 'long', 'hot', 'frozen', 'layered') NOT NULL COMMENT '서빙 스타일 설명',
   `temperature_retention` ENUM('poor', 'moderate', 'good', 'excellent') NOT NULL COMMENT '평균 온도 유지력',
   `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
   `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최종 업데이트일'
) COMMENT '서빙 잔';

ALTER TABLE `base_spirits` ADD CONSTRAINT `PK_BASE_SPIRITS` PRIMARY KEY (
	`base_sprits_id`
);

ALTER TABLE `cocktail_variations` ADD CONSTRAINT `PK_COCKTAIL_VARIATIONS` PRIMARY KEY (
	`cocktail_variation_id`,
	`original_cocktail_id`
);

ALTER TABLE `garnishes` ADD CONSTRAINT `PK_GARNISHES` PRIMARY KEY (
	`garnish_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `tools` ADD CONSTRAINT `PK_TOOLS` PRIMARY KEY (
	`tool_id`
);

ALTER TABLE `cocktail_garnishes` ADD CONSTRAINT `PK_COCKTAIL_GARNISHES` PRIMARY KEY (
	`cocktail_garnished_id`,
	`cocktail_id`,
	`garnish_id`
);

ALTER TABLE `carbonated_integredients` ADD CONSTRAINT `PK_CARBONATED_INTEGREDIENTS` PRIMARY KEY (
	`carbonated_integredient_id`,
	`integredient_id`,
	`carbonated_id`
);

ALTER TABLE `bitters` ADD CONSTRAINT `PK_BITTERS` PRIMARY KEY (
	`bitter_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `other_ingredient_integredients` ADD CONSTRAINT `PK_OTHER_INGREDIENT_INTEGREDIENTS` PRIMARY KEY (
	`other_ingredient_integredient_id`,
	`integredient_id`,
	`other_ingredient_id`
);

ALTER TABLE `syrup_integredients` ADD CONSTRAINT `PK_SYRUP_INTEGREDIENTS` PRIMARY KEY (
	`syrup_integredient_id`,
	`syrups_id`,
	`integredient_id`
);

ALTER TABLE `cocktail_spirit_products` ADD CONSTRAINT `PK_COCKTAIL_SPIRIT_PRODUCTS` PRIMARY KEY (
	`cocktail_spirit_product_id`,
	`cocktail_id`,
	`spirit_products_id`
);

ALTER TABLE `cocktail_glassware` ADD CONSTRAINT `PK_COCKTAIL_GLASSWARE` PRIMARY KEY (
	`cocktail_glassware_id`,
	`cocktail_id`,
	`glass_id`
);

ALTER TABLE `other_ingredients` ADD CONSTRAINT `PK_OTHER_INGREDIENTS` PRIMARY KEY (
	`other_ingredient_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `users` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `cocktail_bitters` ADD CONSTRAINT `PK_COCKTAIL_BITTERS` PRIMARY KEY (
	`cocktail_bitter_id`,
	`cocktail_id`,
	`bitter_id`
);

ALTER TABLE `technique_tools` ADD CONSTRAINT `PK_TECHNIQUE_TOOLS` PRIMARY KEY (
	`technique_tool_id`,
	`technique_id`,
	`tool_id`
);

ALTER TABLE `image_thumbnails` ADD CONSTRAINT `PK_IMAGE_THUMBNAILS` PRIMARY KEY (
	`image_thumbnails_id`,
	`image_id`
);

ALTER TABLE `garnish_integredients` ADD CONSTRAINT `PK_GARNISH_INTEGREDIENTS` PRIMARY KEY (
	`garnish_integredient_id`,
	`integredient_id`,
	`garnish_id`
);

ALTER TABLE `bitter_integredients` ADD CONSTRAINT `PK_BITTER_INTEGREDIENTS` PRIMARY KEY (
	`bitter_integredient_id`,
	`bitter_id`,
	`integredient_id`
);

ALTER TABLE `cocktail_serving_style` ADD CONSTRAINT `PK_COCKTAIL_SERVING_STYLE` PRIMARY KEY (
	`cocktail_serving_style_id`,
	`cocktail_id`,
	`serving_style_id`
);

ALTER TABLE `cocktail_juices` ADD CONSTRAINT `PK_COCKTAIL_JUICES` PRIMARY KEY (
	`cocktail_juice_id`,
	`cocktail_id`,
	`juice_id`
);

ALTER TABLE `dairy_cream` ADD CONSTRAINT `PK_DAIRY_CREAM` PRIMARY KEY (
	`dairy_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `country` ADD CONSTRAINT `PK_COUNTRY` PRIMARY KEY (
	`country_id`
);

ALTER TABLE `cocktail_syrups` ADD CONSTRAINT `PK_COCKTAIL_SYRUPS` PRIMARY KEY (
	`cocktail_syrup_id`,
	`cocktail_id`,
	`syrups_id`
);

ALTER TABLE `brand` ADD CONSTRAINT `PK_BRAND` PRIMARY KEY (
	`brand_id`
);

ALTER TABLE `user_recipe_likes` ADD CONSTRAINT `PK_USER_RECIPE_LIKES` PRIMARY KEY (
	`user_recipe_like_id`,
	`user_id`,
	`cocktail_id`
);

ALTER TABLE `cocktail_dairy_cream` ADD CONSTRAINT `PK_COCKTAIL_DAIRY_CREAM` PRIMARY KEY (
	`cocktail_dairy_cream_id`,
	`cocktail_id`,
	`dairy_id`
);

ALTER TABLE `carbonated` ADD CONSTRAINT `PK_CARBONATED` PRIMARY KEY (
	`carbonated_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `syrups` ADD CONSTRAINT `PK_SYRUPS` PRIMARY KEY (
	`syrups_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `integredients` ADD CONSTRAINT `PK_INTEGREDIENTS` PRIMARY KEY (
	`integredient_id`
);

ALTER TABLE `techniques` ADD CONSTRAINT `PK_TECHNIQUES` PRIMARY KEY (
	`technique_id`
);

ALTER TABLE `user_recipes` ADD CONSTRAINT `PK_USER_RECIPES` PRIMARY KEY (
	`user_recipe_id`,
	`user_id`,
	`cocktail_id`
);

ALTER TABLE `cocktail_sources` ADD CONSTRAINT `PK_COCKTAIL_SOURCES` PRIMARY KEY (
	`cocktail_source_id`
);

ALTER TABLE `cocktails` ADD CONSTRAINT `PK_COCKTAILS` PRIMARY KEY (
	`cocktail_id`,
	`cocktail_source_id`,
	`user_id`
);

ALTER TABLE `cocktail_carbonated` ADD CONSTRAINT `PK_COCKTAIL_CARBONATED` PRIMARY KEY (
	`cocktail_carbonated`,
	`cocktail_id`,
	`carbonated_id`
);

ALTER TABLE `glassware_serving_style` ADD CONSTRAINT `PK_GLASSWARE_SERVING_STYLE` PRIMARY KEY (
	`glassware_serving_style_id`,
	`glass_id`,
	`serving_style_id`
);

ALTER TABLE `juice_integredients` ADD CONSTRAINT `PK_JUICE_INTEGREDIENTS` PRIMARY KEY (
	`juice_integredient_id`,
	`juice_id`,
	`integredient_id`
);

ALTER TABLE `dairy_cream_integredients` ADD CONSTRAINT `PK_DAIRY_CREAM_INTEGREDIENTS` PRIMARY KEY (
	`dairy_cream_integredient_id`,
	`integredient_id`,
	`dairy_id`
);

ALTER TABLE `cocktail_other_ingredients` ADD CONSTRAINT `PK_COCKTAIL_OTHER_INGREDIENTS` PRIMARY KEY (
	`cocktail_other_ingredient_id`,
	`cocktail_id`,
	`other_ingredient_id`
);

ALTER TABLE `juices` ADD CONSTRAINT `PK_JUICES` PRIMARY KEY (
	`juice_id`,
	`brand_id`,
	`country_id`
);

ALTER TABLE `cocktail_techniques` ADD CONSTRAINT `PK_COCKTAIL_TECHNIQUES` PRIMARY KEY (
	`cocktail_technique_id`,
	`cocktail_id`,
	`technique_id`
);

ALTER TABLE `cocktail_tools` ADD CONSTRAINT `PK_COCKTAIL_TOOLS` PRIMARY KEY (
	`cocktail_tool_id`,
	`cocktail_id`,
	`tool_id`
);

ALTER TABLE `cocktail_hashtags` ADD CONSTRAINT `PK_COCKTAIL_HASHTAGS` PRIMARY KEY (
	`cocktail_hashtag_id`,
	`cocktail_id`
);

ALTER TABLE `images` ADD CONSTRAINT `PK_IMAGES` PRIMARY KEY (
	`image_id`,
	`user_id`
);

ALTER TABLE `spirit_products` ADD CONSTRAINT `PK_SPIRIT_PRODUCTS` PRIMARY KEY (
	`spirit_products_id`,
	`base_sprits_id`,
	`country_id`,
	`brand_id`
);

ALTER TABLE `comments` ADD CONSTRAINT `PK_COMMENTS` PRIMARY KEY (
	`comment_id`,
	`user_id`,
	`cocktail_id`
);

ALTER TABLE `serving_style` ADD CONSTRAINT `PK_SERVING_STYLE` PRIMARY KEY (
	`serving_style_id`
);

ALTER TABLE `glassware` ADD CONSTRAINT `PK_GLASSWARE` PRIMARY KEY (
	`glass_id`
);

ALTER TABLE `cocktail_variations` ADD CONSTRAINT `FK_cocktails_TO_cocktail_variations_1` FOREIGN KEY (
	`original_cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_variations` ADD CONSTRAINT `FK_cocktails_TO_cocktail_variations_2` FOREIGN KEY (
	`variation_cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `garnishes` ADD CONSTRAINT `FK_brand_TO_garnishes_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `garnishes` ADD CONSTRAINT `FK_country_TO_garnishes_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `cocktail_garnishes` ADD CONSTRAINT `FK_cocktails_TO_cocktail_garnishes_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_garnishes` ADD CONSTRAINT `FK_garnishes_TO_cocktail_garnishes_1` FOREIGN KEY (
	`garnish_id`
)
REFERENCES `garnishes` (
	`garnish_id`
);

ALTER TABLE `carbonated_integredients` ADD CONSTRAINT `FK_integredients_TO_carbonated_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `carbonated_integredients` ADD CONSTRAINT `FK_carbonated_TO_carbonated_integredients_1` FOREIGN KEY (
	`carbonated_id`
)
REFERENCES `carbonated` (
	`carbonated_id`
);

ALTER TABLE `bitters` ADD CONSTRAINT `FK_brand_TO_bitters_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `bitters` ADD CONSTRAINT `FK_country_TO_bitters_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `other_ingredient_integredients` ADD CONSTRAINT `FK_integredients_TO_other_ingredient_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `other_ingredient_integredients` ADD CONSTRAINT `FK_other_ingredients_TO_other_ingredient_integredients_1` FOREIGN KEY (
	`other_ingredient_id`
)
REFERENCES `other_ingredients` (
	`other_ingredient_id`
);

ALTER TABLE `syrup_integredients` ADD CONSTRAINT `FK_syrups_TO_syrup_integredients_1` FOREIGN KEY (
	`syrups_id`
)
REFERENCES `syrups` (
	`syrups_id`
);

ALTER TABLE `syrup_integredients` ADD CONSTRAINT `FK_integredients_TO_syrup_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `cocktail_spirit_products` ADD CONSTRAINT `FK_cocktails_TO_cocktail_spirit_products_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_spirit_products` ADD CONSTRAINT `FK_spirit_products_TO_cocktail_spirit_products_1` FOREIGN KEY (
	`spirit_products_id`
)
REFERENCES `spirit_products` (
	`spirit_products_id`
);

ALTER TABLE `cocktail_glassware` ADD CONSTRAINT `FK_cocktails_TO_cocktail_glassware_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_glassware` ADD CONSTRAINT `FK_glassware_TO_cocktail_glassware_1` FOREIGN KEY (
	`glass_id`
)
REFERENCES `glassware` (
	`glass_id`
);

ALTER TABLE `other_ingredients` ADD CONSTRAINT `FK_brand_TO_other_ingredients_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `other_ingredients` ADD CONSTRAINT `FK_country_TO_other_ingredients_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `cocktail_bitters` ADD CONSTRAINT `FK_cocktails_TO_cocktail_bitters_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_bitters` ADD CONSTRAINT `FK_bitters_TO_cocktail_bitters_1` FOREIGN KEY (
	`bitter_id`
)
REFERENCES `bitters` (
	`bitter_id`
);

ALTER TABLE `technique_tools` ADD CONSTRAINT `FK_techniques_TO_technique_tools_1` FOREIGN KEY (
	`technique_id`
)
REFERENCES `techniques` (
	`technique_id`
);

ALTER TABLE `technique_tools` ADD CONSTRAINT `FK_tools_TO_technique_tools_1` FOREIGN KEY (
	`tool_id`
)
REFERENCES `tools` (
	`tool_id`
);

ALTER TABLE `image_thumbnails` ADD CONSTRAINT `FK_images_TO_image_thumbnails_1` FOREIGN KEY (
	`image_id`
)
REFERENCES `images` (
	`image_id`
);

ALTER TABLE `garnish_integredients` ADD CONSTRAINT `FK_integredients_TO_garnish_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `garnish_integredients` ADD CONSTRAINT `FK_garnishes_TO_garnish_integredients_1` FOREIGN KEY (
	`garnish_id`
)
REFERENCES `garnishes` (
	`garnish_id`
);

ALTER TABLE `bitter_integredients` ADD CONSTRAINT `FK_bitters_TO_bitter_integredients_1` FOREIGN KEY (
	`bitter_id`
)
REFERENCES `bitters` (
	`bitter_id`
);

ALTER TABLE `bitter_integredients` ADD CONSTRAINT `FK_integredients_TO_bitter_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `cocktail_serving_style` ADD CONSTRAINT `FK_cocktails_TO_cocktail_serving_style_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_serving_style` ADD CONSTRAINT `FK_serving_style_TO_cocktail_serving_style_1` FOREIGN KEY (
	`serving_style_id`
)
REFERENCES `serving_style` (
	`serving_style_id`
);

ALTER TABLE `cocktail_juices` ADD CONSTRAINT `FK_cocktails_TO_cocktail_juices_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_juices` ADD CONSTRAINT `FK_juices_TO_cocktail_juices_1` FOREIGN KEY (
	`juice_id`
)
REFERENCES `juices` (
	`juice_id`
);

ALTER TABLE `dairy_cream` ADD CONSTRAINT `FK_brand_TO_dairy_cream_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `dairy_cream` ADD CONSTRAINT `FK_country_TO_dairy_cream_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `cocktail_syrups` ADD CONSTRAINT `FK_cocktails_TO_cocktail_syrups_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_syrups` ADD CONSTRAINT `FK_syrups_TO_cocktail_syrups_1` FOREIGN KEY (
	`syrups_id`
)
REFERENCES `syrups` (
	`syrups_id`
);

ALTER TABLE `user_recipe_likes` ADD CONSTRAINT `FK_users_TO_user_recipe_likes_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

ALTER TABLE `user_recipe_likes` ADD CONSTRAINT `FK_cocktails_TO_user_recipe_likes_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_dairy_cream` ADD CONSTRAINT `FK_cocktails_TO_cocktail_dairy_cream_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_dairy_cream` ADD CONSTRAINT `FK_dairy_cream_TO_cocktail_dairy_cream_1` FOREIGN KEY (
	`dairy_id`
)
REFERENCES `dairy_cream` (
	`dairy_id`
);

ALTER TABLE `carbonated` ADD CONSTRAINT `FK_brand_TO_carbonated_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `carbonated` ADD CONSTRAINT `FK_country_TO_carbonated_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `syrups` ADD CONSTRAINT `FK_brand_TO_syrups_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `syrups` ADD CONSTRAINT `FK_country_TO_syrups_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `user_recipes` ADD CONSTRAINT `FK_users_TO_user_recipes_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

ALTER TABLE `user_recipes` ADD CONSTRAINT `FK_cocktails_TO_user_recipes_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktails` ADD CONSTRAINT `FK_cocktail_sources_TO_cocktails_1` FOREIGN KEY (
	`cocktail_source_id`
)
REFERENCES `cocktail_sources` (
	`cocktail_source_id`
);

ALTER TABLE `cocktails` ADD CONSTRAINT `FK_users_TO_cocktails_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

ALTER TABLE `cocktail_carbonated` ADD CONSTRAINT `FK_cocktails_TO_cocktail_carbonated_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_carbonated` ADD CONSTRAINT `FK_carbonated_TO_cocktail_carbonated_1` FOREIGN KEY (
	`carbonated_id`
)
REFERENCES `carbonated` (
	`carbonated_id`
);

ALTER TABLE `glassware_serving_style` ADD CONSTRAINT `FK_glassware_TO_glassware_serving_style_1` FOREIGN KEY (
	`glass_id`
)
REFERENCES `glassware` (
	`glass_id`
);

ALTER TABLE `glassware_serving_style` ADD CONSTRAINT `FK_serving_style_TO_glassware_serving_style_1` FOREIGN KEY (
	`serving_style_id`
)
REFERENCES `serving_style` (
	`serving_style_id`
);

ALTER TABLE `juice_integredients` ADD CONSTRAINT `FK_juices_TO_juice_integredients_1` FOREIGN KEY (
	`juice_id`
)
REFERENCES `juices` (
	`juice_id`
);

ALTER TABLE `juice_integredients` ADD CONSTRAINT `FK_integredients_TO_juice_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `dairy_cream_integredients` ADD CONSTRAINT `FK_integredients_TO_dairy_cream_integredients_1` FOREIGN KEY (
	`integredient_id`
)
REFERENCES `integredients` (
	`integredient_id`
);

ALTER TABLE `dairy_cream_integredients` ADD CONSTRAINT `FK_dairy_cream_TO_dairy_cream_integredients_1` FOREIGN KEY (
	`dairy_id`
)
REFERENCES `dairy_cream` (
	`dairy_id`
);

ALTER TABLE `cocktail_other_ingredients` ADD CONSTRAINT `FK_cocktails_TO_cocktail_other_ingredients_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_other_ingredients` ADD CONSTRAINT `FK_other_ingredients_TO_cocktail_other_ingredients_1` FOREIGN KEY (
	`other_ingredient_id`
)
REFERENCES `other_ingredients` (
	`other_ingredient_id`
);

ALTER TABLE `juices` ADD CONSTRAINT `FK_brand_TO_juices_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `juices` ADD CONSTRAINT `FK_country_TO_juices_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `cocktail_techniques` ADD CONSTRAINT `FK_cocktails_TO_cocktail_techniques_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_techniques` ADD CONSTRAINT `FK_techniques_TO_cocktail_techniques_1` FOREIGN KEY (
	`technique_id`
)
REFERENCES `techniques` (
	`technique_id`
);

ALTER TABLE `cocktail_tools` ADD CONSTRAINT `FK_cocktails_TO_cocktail_tools_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `cocktail_tools` ADD CONSTRAINT `FK_tools_TO_cocktail_tools_1` FOREIGN KEY (
	`tool_id`
)
REFERENCES `tools` (
	`tool_id`
);

ALTER TABLE `cocktail_hashtags` ADD CONSTRAINT `FK_cocktails_TO_cocktail_hashtags_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

ALTER TABLE `images` ADD CONSTRAINT `FK_users_TO_images_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

ALTER TABLE `spirit_products` ADD CONSTRAINT `FK_base_spirits_TO_spirit_products_1` FOREIGN KEY (
	`base_sprits_id`
)
REFERENCES `base_spirits` (
	`base_sprits_id`
);

ALTER TABLE `spirit_products` ADD CONSTRAINT `FK_country_TO_spirit_products_1` FOREIGN KEY (
	`country_id`
)
REFERENCES `country` (
	`country_id`
);

ALTER TABLE `spirit_products` ADD CONSTRAINT `FK_brand_TO_spirit_products_1` FOREIGN KEY (
	`brand_id`
)
REFERENCES `brand` (
	`brand_id`
);

ALTER TABLE `comments` ADD CONSTRAINT `FK_users_TO_comments_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `users` (
	`user_id`
);

ALTER TABLE `comments` ADD CONSTRAINT `FK_cocktails_TO_comments_1` FOREIGN KEY (
	`cocktail_id`
)
REFERENCES `cocktails` (
	`cocktail_id`
);

