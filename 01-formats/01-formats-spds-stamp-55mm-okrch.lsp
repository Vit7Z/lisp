;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// название программы****************                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-stamp-55mm-okrch

(block-name type-okrch / adoc lin-1 lin-10 lin-11 lin-12 lin-13 lin-14 lin-15 lin-16 lin-17 lin-18 lin-19 lin-2 lin-20 lin-21 lin-22 lin-23 lin-24 lin-25 lin-26 lin-27 lin-28 lin-29 lin-3 lin-30 lin-31 lin-32 lin-33 lin-34 lin-35 lin-36 
lin-37 lin-38 lin-4 lin-5 lin-6 lin-7 lin-8 lin-9 rctn-1 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-16 rctn-17 rctn-18 rctn-19 rctn-2 rctn-20 rctn-21 rctn-22 rctn-23 rctn-24 rctn-25 rctn-26 rctn-27 rctn-3 rctn-4 rctn-5 rctn-6 
rctn-7 rctn-8 rctn-9 txt-1 txt-10 txt-11 txt-12 txt-13 txt-14 txt-15 txt-16 txt-17 txt-18 txt-19 txt-2 txt-20 txt-21 txt-22 txt-23 txt-24 txt-25 txt-26 txt-27 txt-28 txt-29 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 txt-9)

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(if (= (tblsearch "layer" "wspom") nil)
  (command "_layer" "Создать" "wspom" "Тип" "Continuous" "wspom" "Цвет" 3 "wspom" "");создаем слой wspom
);if

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "block" block-name) nil)
	(progn
		(setvar	"OSMODE" 0)
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
						
(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -180. 32.5) ; нач точка текста
      '(11 -180. 32.5) ; нач точка текста
      '(1 . "Изм.") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  );entmakex
);setq
		
(setq txt-2 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -170 32.5)
      '(11 -170 32.5)
      '(1 . "Кол.уч.")
      '(40 . 2.5) 
      '(41 . 0.8) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle"))
    );list
  );entmakex
);setq

(setq txt-3 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -160 32.5)
      '(11 -160 32.5)
      '(1 . "Лист") 
      '(40 . 2.5) 
      '(41 . 0.8) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

(setq txt-4 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -150 32.5)
      '(11 -150 32.5) 
      '(1 . "№ док.") 
      '(40 . 2.5) 
      '(41 . 0.8) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq
		
(setq txt-5 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -137.5 32.5)
      '(11 -137.5 32.5)
      '(1 . "Подпись") 
      '(40 . 2.5) 
      '(41 . 0.8)
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2)
      '(370 . -1) 
       (cons 7 (getvar "textstyle"))
     );list
  );entmakex
);setq

(setq txt-6 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 32.5)
      '(11 -125 32.5)
      '(1 . "Дата")
      '(40 . 2.5) 
      '(41 . 0.8) 
      '(50 . 0)
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle"))
    );list
  );entmakex
);setq

(setq txt-7 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -184.5 27.5) 
      '(11 -184.5 27.5) 
      '(1 . "Инженер") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 0) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle"))
    );list
  );entmakex
);setq

(setq txt-8
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -184.5 22.5) 
      '(11 -184.5 22.5) 
      '(1 . "Нач. отдела") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 0) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

(setq txt-9
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -184.5 17.5) 
      '(11 -184.5 17.5) 
      '(1 . "ГИП") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 0) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

(setq txt-10
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -184.5 12.5) 
      '(11 -184.5 12.5) 
      '(1 . "Гл. инженер") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 0) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

(setq txt-11
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -184.5 2.5) 
      '(11 -184.5 2.5) 
      '(1 . "Н. контр.") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 0) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

(setq txt-12
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -164.5 27.5)
      '(11 -164.5 27.5)
      '(1 . "******1")
      '(40 . 2.5)
      '(41 . 1)
      '(50 . 0)
      '(72 . 0)
      '(73 . 2)
      '(370 . -1)
       (cons 7 (getvar "textstyle"))
    );list
  );entmakex
);setq

(setq txt-13
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -164.5 22.5) ; нач точка текста
      '(11 -164.5 22.5) ; нач точка текста
      '(1 . "******2") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 0) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  ); entmakex
); setq

(setq txt-14
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -164.5 17.5) ; нач точка текста
      '(11 -164.5 17.5) ; нач точка текста
      '(1 . "******3") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 0) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  ); entmakex
); setq

(setq txt-15
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -164.5 12.5) ; нач точка текста
      '(11 -164.5 12.5) ; нач точка текста
      '(1 . "******4") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 0) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  ); entmakex
); setq

(setq txt-16
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -164.5 2.5) ; нач точка текста
      '(11 -164.5 2.5) ; нач точка текста
      '(1 . "******5") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 0) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  ); entmakex
); setq

(setq txt-17
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 27.5) 
      '(11 -125 27.5) 
      '(1 . "дат1") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1)
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-18
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 22.5) 
      '(11 -125 22.5) 
      '(1 . "дат2") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-19
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 17.5) 
      '(11 -125 17.5) 
      '(1 . "дат3") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-20
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 12.5) 
      '(11 -125 12.5) 
      '(1 . "дат4") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-21
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 2.5) 
      '(11 -125 2.5) 
      '(1 . "дат5") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-22
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -60. 50.) 
      '(11 -60. 50.) 
       (cons 1 (strcat "*******-" type-okrch)) 
      '(40 . 3.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  );entmakex
); setq

(setq txt-23
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
      '(10 -60. 37.5) 
      '(1 . "наименование предприятия *******") 
      '(40 . 3.5) 
      '(41 . 120) 
      '(42 . 120) 
      '(71 . 5) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-24
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
      '(10 -85. 22.5) 
      '(1 . "наименование здания (сооружения) и при необходимости, вид строительства") 
      '(8 . "wspom")
      '(40 . 2.5) 
      '(41 . 69) 
      '(42 . 69) 
      '(71 . 5) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

(setq txt-25
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -42.5 27.5) 
      '(11 -42.5 27.5) 
      '(1 . "Стадия") 
      '(40 . 2.5) 
      '(41 . 1) 
      '(50 . 0) 
      '(72 . 1) 
      '(73 . 2) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    ) ;list
  ); entmakex
); setq

	(setq txt-26
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				'(10 -27.5 27.5) 
				'(11 -27.5 27.5) 
				'(1 . "Лист") 
				'(40 . 2.5) 
				'(41 . 1) 
				'(50 . 0) 
				'(72 . 1) 
				'(73 . 2) 
				'(370 . -1) 
				 (cons 7 (getvar "textstyle")) 
			) ;list
		); entmakex
	); setq

	(setq txt-27
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				'(10 -10. 27.5) 
				'(11 -10. 27.5) 
				'(1 . "Листов") 
				'(40 . 2.5) 
				'(41 . 1) 
				'(50 . 0) 
				'(72 . 1) 
				'(73 . 2) 
				'(370 . -1) 
				 (cons 7 (getvar "textstyle")) 
			) ;list
		); entmakex
	); setq

	(setq txt-28
		(entmakex
			(list
				'(0 . "MTEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbMText")
				'(10 -25. 7.5) 
				'(1 . "ООО \"*******\", \\P г. Москва") 
				'(40 . 3.5)
				'(41 . 50) 
				'(42 . 50) 
				'(71 . 5) 
				'(370 . -1) 
				 (cons 7 (getvar "textstyle")) 
			) ;list
		); entmakex
	); setq

	(setq txt-29
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				'(10 -42.5 20.)
				'(11 -42.5 20.)
				'(1 . "Р**")
				'(40 . 3.5)
				'(41 . 1)
				'(50 . 0)
				'(72 . 1)
				'(73 . 2)
				'(370 . -1)
				 (cons 7 (getvar "textstyle"))
			);list
		);entmakex
	);setq

  (command "_block" block-name '(0 0)
    rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-16 rctn-17 rctn-18 rctn-19 rctn-20 rctn-21 rctn-22 rctn-23 rctn-24 rctn-25 rctn-26 rctn-27
    lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 lin-8 lin-9 lin-10 lin-11 lin-12 lin-13 lin-14 lin-15 lin-16 lin-17 lin-18 lin-19 lin-20 lin-21 lin-22 lin-23 lin-24 lin-25 lin-26 lin-27 lin-28 lin-29 
    lin-30 lin-31 lin-32 lin-33 lin-34 lin-35 lin-36 lin-37 lin-38
		txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 txt-9 txt-10 txt-11 txt-12 txt-13 txt-14 txt-15 txt-16 txt-17 txt-18 txt-19 txt-20 txt-21 txt-22 txt-23 txt-24 txt-25 txt-26 txt-27 txt-28 txt-29
		"")
  );progn
);if

(vla-endundomark adoc)
(setvar "cmdecho" 0)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////




