;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// название программы****************                           //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
(defun 101-00-spcf-stamp-55mm

(block-name / adoc index-base index-spcf lin-1 lin-10 lin-11 lin-12 lin-13 lin-14 lin-15 lin-16 lin-17 lin-18 lin-19 lin-2 lin-20 lin-21 
lin-22 lin-23 lin-24 lin-25 lin-26 lin-27 lin-28 lin-29 lin-3 lin-30 lin-31 lin-32 lin-33 lin-34 lin-35 lin-36 lin-37 lin-38 lin-4 lin-5 
lin-6 lin-7 lin-8 lin-9 rctn-1 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-16 rctn-17 rctn-18 rctn-19 rctn-2 rctn-20 rctn-21 
rctn-22 rctn-23 rctn-24 rctn-25 rctn-26 rctn-27 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 str-base txt-1 txt-10 txt-11 txt-12 txt-2 
txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 txt-9)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar	"OSMODE" 0)

(if (= (tblsearch "layer" "wspom") nil)
  (command "_layer" "Создать" "wspom" "Тип" "Continuous" "wspom" "Цвет" 3 "wspom" ""); создаем слой wspom
);if

(setq str-base (substr block-name (+ (vl-string-search "спдс-" block-name) 6));имя блока штампа окрч
      index-base (substr str-base (+ (vl-string-search "-" str-base) 2))
      str-base (substr str-base 1 (+ (vl-string-search "-" str-base) 0))	
      str-base (strcase str-base)		
			index-base (substr index-base 1 (vl-string-search "-" index-base))
			
			index-spcf (substr block-name (+ (vl-string-search "спцф-" block-name) 6))
			str-base (strcat str-base "." index-base ".С" index-spcf)
);setq

;создаем штамп 55мм спецификации
(if (= (tblsearch "block" block-name) nil)
	(progn
	  ;квадраты, толщина 0.6мм
	  (setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
	  (command "_RECTANGLE" '(-185 55) '(-175 35)) 
 		(setq rctn-1 (entlast))
 		(command "_RECTANGLE" '(-175 55) '(-165 35))
 		(setq rctn-2 (entlast))
		(command "_RECTANGLE" '(-165 55) '(-155 35))	
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-155 55) '(-145 35))
		(setq rctn-4 (entlast))
		(command "_RECTANGLE" '(-145 55) '(-130 35))
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(-130 55) '(-120 35))
		(setq rctn-6 (entlast))
		(command "_RECTANGLE" '(-185 35) '(-175 30))
		(setq rctn-7 (entlast))
    (command "_RECTANGLE" '(-175 35) '(-165 30))
		(setq rctn-8 (entlast))
		(command "_RECTANGLE" '(-165 35) '(-155 30))
		(setq rctn-9 (entlast))
		(command "_RECTANGLE" '(-155 35) '(-145 30))
		(setq rctn-10 (entlast))
		(command "_RECTANGLE" '(-145 35) '(-130 30))
		(setq rctn-11 (entlast))
		(command "_RECTANGLE" '(-130 35) '(-120 30))
		(setq rctn-12 (entlast))
		(command "_RECTANGLE" '(-185 30) '(-165 0))
		(setq rctn-13 (entlast))
		(command "_RECTANGLE" '(-165 30) '(-145 0))
		(setq rctn-14 (entlast))
		(command "_RECTANGLE" '(-145 30) '(-130 0))
		(setq rctn-15 (entlast))
		(command "_RECTANGLE" '(-130 30) '(-120 0))
		(setq rctn-16 (entlast))
		(command "_RECTANGLE" '(-120 55) '(0 45))
		(setq rctn-17 (entlast))
 		(command "_RECTANGLE" '(-120 45) '(0 30))
		(setq rctn-18 (entlast))
		(command "_RECTANGLE" '(-120 30) '(-50 15))	
		(setq rctn-19 (entlast))
		(command "_RECTANGLE" '(-120 15) '(-50 0))	
		(setq rctn-20 (entlast))
		(command "_RECTANGLE" '(-50 30) '(-35 25))
		(setq rctn-21 (entlast))
		(command "_RECTANGLE" '(-35 30) '(-20 25))
		(setq rctn-22 (entlast))
		(command "_RECTANGLE" '(-20 30) '(0 25))
		(setq rctn-23 (entlast))
		(command "_RECTANGLE" '(-50 25) '(-35 15))
		(setq rctn-24 (entlast))
    (command "_RECTANGLE" '(-35 25) '(-20 15))
		(setq rctn-25 (entlast))
		(command "_RECTANGLE" '(-20 25) '(0 15))
		(setq rctn-26 (entlast))
		(command "_RECTANGLE" '(-50 15) '(0 0))
		(setq rctn-27 (entlast))

    ;линии, толщина По слою
		(setvar "CELWEIGHT" -1)
		(command "_.line" '(-185 50) '(-175 50) "")
		(setq lin-1 (entlast))
		(command "_.line" '(-175 50) '(-165 50) "")
		(setq lin-2 (entlast))
		(command "_.line" '(-165 50) '(-155 50) "")
		(setq lin-3 (entlast))
		(command "_.line" '(-155 50) '(-145 50) "")
		(setq lin-4 (entlast))
		(command "_.line" '(-145 50) '(-130 50) "")
		(setq lin-5 (entlast))
		(command "_.line" '(-130 50) '(-120 50) "")
		(setq lin-6 (entlast))
		(command "_.line" '(-185 45) '(-175 45) "")
		(setq lin-7 (entlast))
		(command "_.line" '(-175 45) '(-165 45) "")
		(setq lin-8 (entlast))
		(command "_.line" '(-165 45) '(-155 45) "")
		(setq lin-9 (entlast))
		(command "_.line" '(-155 45) '(-145 45) "")
		(setq lin-10 (entlast))
		(command "_.line" '(-145 45) '(-130 45) "")
		(setq lin-11 (entlast))
		(command "_.line" '(-130 45) '(-120 45) "")
		(setq lin-12 (entlast))
		(command "_.line" '(-185 40) '(-175 40) "")
		(setq lin-13 (entlast))
		(command "_.line" '(-175 40) '(-165 40) "")
		(setq lin-14 (entlast))
		(command "_.line" '(-165 40) '(-155 40) "")
		(setq lin-15 (entlast))
		(command "_.line" '(-155 40) '(-145 40) "")
		(setq lin-16 (entlast))
		(command "_.line" '(-145 40) '(-130 40) "")
		(setq lin-17 (entlast))
		(command "_.line" '(-130 40) '(-120 40) "")
		(setq lin-18 (entlast))
		(command "_.line" '(-185 25) '(-165 25) "")
		(setq lin-19 (entlast))
		(command "_.line" '(-165 25) '(-145 25) "")
		(setq lin-20 (entlast))
		(command "_.line" '(-145 25) '(-130 25) "")
		(setq lin-21 (entlast))
		(command "_.line" '(-130 25) '(-120 25) "")
		(setq lin-22 (entlast))
		(command "_.line" '(-185 20) '(-165 20) "")
		(setq lin-23 (entlast))
		(command "_.line" '(-165 20) '(-145 20) "")
		(setq lin-24 (entlast))
		(command "_.line" '(-145 20) '(-130 20) "")
		(setq lin-25 (entlast))
		(command "_.line" '(-130 20) '(-120 20) "")
		(setq lin-26 (entlast))
		(command "_.line" '(-185 15) '(-165 15) "")
		(setq lin-27 (entlast))
		(command "_.line" '(-165 15) '(-145 15) "")
		(setq lin-28 (entlast))
		(command "_.line" '(-145 15) '(-130 15) "")
		(setq lin-29 (entlast))
		(command "_.line" '(-130 15) '(-120 15) "")
		(setq lin-30 (entlast))		
		(command "_.line" '(-185 10) '(-165 10) "")
		(setq lin-31 (entlast))
		(command "_.line" '(-165 10) '(-145 10) "")
		(setq lin-32 (entlast))
		(command "_.line" '(-145 10) '(-130 10) "")
		(setq lin-33 (entlast))
		(command "_.line" '(-130 10) '(-120 10) "")
		(setq lin-34 (entlast))		
		(command "_.line" '(-185 5) '(-165 5) "")
		(setq lin-35 (entlast))
		(command "_.line" '(-165 5) '(-145 5) "")
		(setq lin-36 (entlast))
		(command "_.line" '(-145 5) '(-130 5) "")
		(setq lin-37 (entlast))
		(command "_.line" '(-130 5) '(-120 5) "")
		(setq lin-38 (entlast))
		
		(setvar "textstyle" "Standard")
		(command "_text" "_MC" (list -180 32.5) 2.5 0 "Изм.")
		(setq txt-1 (entlast));setq
		(command "_text" "_MC" (list -170 32.5) 2.5 0 "Кол.уч.")
		(setq txt-2 (entlast));setq
		(command "_text" "_MC" (list -160 32.5) 2.5 0 "Лист")
		(setq txt-3 (entlast));setq
		(command "_text" "_MC" (list -150 32.5) 2.5 0 "№ док.")
		(setq txt-4 (entlast));setq
		(command "_text" "_MC" (list -137.5 32.5) 2.5 0 "Подпись")
		(setq txt-5 (entlast));setq
		(command "_text" "_MC" (list -125 32.5) 2.5 0 "Дата")
		(setq txt-6 (entlast));setq
		(command "_text" "_MC" (list -42.5 27.5) 2.5 0 "Стадия")
		(setq txt-7 (entlast));setq
    (command "_text" "_MC" (list -27.5 27.5) 2.5 0 "Лист")
		(setq txt-8 (entlast));setq
    (command "_text" "_MC" (list -10. 27.5) 2.5 0 "Листов")
		(setq txt-9 (entlast));setq
		(command "_text" "_MC" (list -27.5 20) 2.5 0 "1")
		(setq txt-10 (entlast));setq
				
		(setq txt-11
			(entmakex
				(list
					'(0 . "MTEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbMText")
					'(10 -85. 7.5);нач точка
					'(1 . "Спецификация оборудования, изделий и материалов");текст
					'(8 . "wspom")
					'(40 . 2.5);высота
					'(41 . 69);растяжение
					'(42 . 69);ширина
					'(71 . 5);гориз выравнивание
					'(370 . -1);толщина
				);list
			);entmakex
		);setq
		
	(setq txt-12
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				'(10 -60. 50.) 
				'(11 -60. 50.) 
				(cons 1 str-base);текст
				'(8 . "wspom") 
				'(40 . 3.5);высота
				'(41 . 1) 
				'(50 . 0) 
				'(72 . 1) 
				'(73 . 2) 
				'(370 . -1)  
			) ;list
		);entmakex
	);setq

   (command "_block" block-name '(0 0) 
		  rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-16 rctn-17 rctn-18
		  rctn-19 rctn-20 rctn-21 rctn-22 rctn-23 rctn-24 rctn-25 rctn-26 rctn-27
		  lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 lin-8 lin-9 lin-10 lin-11 lin-12 lin-13 lin-14 lin-15 lin-16 lin-17 lin-18 lin-19 lin-20 
		  lin-21 lin-22 lin-23 lin-24 lin-25 lin-26 lin-27 lin-28 lin-29 lin-30 lin-31 lin-32 lin-33 lin-34 lin-35 lin-36 lin-37 lin-38
		  txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 txt-9 txt-10 txt-11 txt-12
		"")
  );progn
);if

(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////