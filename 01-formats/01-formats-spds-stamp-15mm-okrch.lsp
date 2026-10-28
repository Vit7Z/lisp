;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-stamp-15mm-okrch

(block-name-15 type-okrch / adoc lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 rctn-1 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8)

(setvar "cmdecho" 0)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "block" block-name-15) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
 		(command "_RECTANGLE" '(-185 15) '(-175 5))
		(setq rctn-1 (entlast))
 		(command "_RECTANGLE" '(-185 5) '(-175 0))
		(setq rctn-2 (entlast))	
		(command "_RECTANGLE" '(-175 15) '(-165 5))	
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-175 5) '(-165 0))
		(setq rctn-4 (entlast))
		(command "_RECTANGLE" '(-165 15) '(-155 5))
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(-165 5) '(-155 0))
		(setq rctn-6 (entlast))
		(command "_RECTANGLE" '(-155 15) '(-145 5))
		(setq rctn-7 (entlast))
    (command "_RECTANGLE" '(-155 5) '(-145 0))
		(setq rctn-8 (entlast))
		(command "_RECTANGLE" '(-145 15) '(-130 5))
		(setq rctn-9 (entlast))
		(command "_RECTANGLE" '(-145 5) '(-130 0))
		(setq rctn-10 (entlast))
		(command "_RECTANGLE" '(-130 15) '(-120 5))
		(setq rctn-11 (entlast))
		(command "_RECTANGLE" '(-130 5) '(-120 0))
		(setq rctn-12 (entlast))
		(command "_RECTANGLE" '(-120 15) '(-10 0))
		(setq rctn-13 (entlast))
		(command "_RECTANGLE" '(-10 15) '(0 8))
		(setq rctn-14 (entlast))
		(command "_RECTANGLE" '(-10 8) '(0 0))
		(setq rctn-15 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_.line" '(-185 10) '(-175 10) "")
		(setq lin-1 (entlast))
		(command "_.line" '(-175 10) '(-165 10) "")
		(setq lin-2 (entlast))
		(command "_.line" '(-165 10) '(-155 10) "")
		(setq lin-3 (entlast))
		(command "_.line" '(-155 10) '(-145 10) "")
		(setq lin-4 (entlast))
		(command "_.line" '(-145 10) '(-130 10) "")
		(setq lin-5 (entlast))
		(command "_.line" '(-130 10) '(-120 10) "")
		(setq lin-6 (entlast))
						
(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -180. 2.5) ; нач точка текста
      '(11 -180. 2.5) ; нач точка текста
      '(1 . "Изм.") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    );list
  );entmakex
);setq
		
(setq txt-2 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -170 2.5) ; нач точка текста
      '(11 -170 2.5) ; нач точка текста
      '(1 . "Кол.уч.") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-3 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -160 2.5) ; нач точка текста
      '(11 -160 2.5) ; нач точка текста
      '(1 . "Лист") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-4 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -150 2.5) ; нач точка текста
      '(11 -150 2.5) ; нач точка текста
      '(1 . "№ док.") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq	
		
(setq txt-5 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -137.5 2.5) ; нач точка текста
      '(11 -137.5 2.5) ; нач точка текста
      '(1 . "Подпись") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-6 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -125 2.5) ; нач точка текста
      '(11 -125 2.5) ; нач точка текста
      '(1 . "Дата") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 0.8) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-7 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -65 7.5) ; нач точка текста
      '(11 -65 7.5) ; нач точка текста
       (cons 1 type-okrch) ; содержание текста
      '(40 . 3.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq	

(setq txt-8
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      '(10 -5 11.5) ; нач точка текста
      '(11 -5 11.5) ; нач точка текста
      '(1 . "Лист") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

  (command "_block" block-name-15 '(0 0) rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 
  																		lin-1 lin-2 lin-3 lin-4 lin-5 lin-6	
  																		txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 "")
  ); end progn
); end if

(vla-endundomark adoc)	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
