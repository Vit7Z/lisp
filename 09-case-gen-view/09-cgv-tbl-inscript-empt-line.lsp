;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// пустая строка таблицы надписей овш                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 09-cgv-tbl-inscript-empt-line

( / adoc dlt-y-rctgl drctn-y lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 nmbr-ln pnt-1 pnt-ins pnt-ins-txt-1 pnt-ins-txt-2 pnt-ins-txt-3 txt-1 txt-2 
txt-3 xpnt-ins ypnt-1 ypnt-ins y-tmp)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar	"OSMODE" 0)
(setvar "CMDECHO" 0)

(if (= (tblsearch "block" "овш-таблица-надписей-пустая-строка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_LINE" '(-15 0) '(-15 -8) "")
		(setq lin-1 (entlast))
		(command "_LINE" '(0 0) '(0 -8) "")
		(setq lin-2 (entlast))
		(command "_LINE" '(70 0) '(70 -8) "")
		(setq lin-3 (entlast))
		(command "_LINE" '(80 0) '(80 -8) "")
		(setq lin-4 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_LINE" '(-15 -8) '(0 -8) "")
		(setq lin-5 (entlast))
		(command "_LINE" '(0 -8) '(70 -8) "")
		(setq lin-6 (entlast))
		(command "_LINE" '(70 -8) '(80 -8) "")
		(setq lin-7 (entlast))
								
		(command "_block" "овш-таблица-надписей-пустая-строка"  '(0 0)
		  lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7
		"")
); end progn
); end if

(setvar	"OSMODE" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-1 (getpoint "\nУкажите точку направления\n")
			ypnt-1 (nth 1 pnt-1)
			y-tmp nil		
);setq

(setq	drctn-y (- ypnt-ins ypnt-1));setq, ;направление вставки по вертикали

(if	(> drctn-y 0)
  (setq dlt-y-rctgl -8);setq
);if

(if	(< drctn-y 0)
  (setq y-tmp ypnt-ins
				ypnt-ins ypnt-1
				ypnt-1 y-tmp
				dlt-y-rctgl -8
	);setq
);if

(setq nmbr-ln (fix (/ drctn-y 8)));setq

(if	(< (abs nmbr-ln) 1)
  (setq nmbr-ln 1);setq
);if

(repeat (abs nmbr-ln)
	(progn
		(setq pnt-ins (list xpnt-ins ypnt-ins)
		 			pnt-ins-txt-1 (list (- xpnt-ins 7.5) (- ypnt-ins 4)) ;номер надписи
      		pnt-ins-txt-2 (list (+ xpnt-ins 1) (- ypnt-ins 4)) ;текст надписи
      		pnt-ins-txt-3 (list (+ xpnt-ins 75) (- ypnt-ins 4)) ;кол надписей
		);setq
		(command "_insert" "овш-таблица-надписей-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
		(setq txt-1 ;номер надписи
  		(entmakex
	  		(list
		  		'(0 . "TEXT")
		  		'(100 . "AcDbEntity")
		  		'(100 . "AcDbText")
		 			 (cons 10 pnt-ins-txt-1) ; нач точка текста
		 			 (cons 11 pnt-ins-txt-1) ; нач точка текста
				   (cons 1 "**") ; содержание текста
		 		  '(40 . 2.5) ; высота текста
		 		  '(41 . 1) ; растяжение текста
		 		  '(50 . 0) ; поворот текста
		 		  '(72 . 1) ; гориз выравнивание текста
		 		  '(73 . 2) ; верт выравнивание текста
		 		  '(370 . -1) ; толщина текста
			 		(cons 7 (getvar "textstyle")) ; стиль текста
	  		);list
  		);entmakex
		);setq
		
		(setq txt-2 ;текст надписи
  		(entmakex
	  		(list
		  		'(0 . "TEXT")
		  		'(100 . "AcDbEntity")
		  		'(100 . "AcDbText")
		  		 (cons 10 pnt-ins-txt-2) ; нач точка текста
		  		 (cons 11 pnt-ins-txt-2) ; нач точка текста
		  		 (cons 1 "**") ; содержание текста
		  		'(40 . 2.5) ; высота текста
		  		'(41 . 1) ; растяжение текста
		  		'(50 . 0) ; поворот текста
		  		'(72 . 0) ; гориз выравнивание текста
		  		'(73 . 2) ; верт выравнивание текста
		  		'(370 . -1) ; толщина текста
		  		 (cons 7 (getvar "textstyle")) ; стиль текста
	  		);list
  		);entmakex
		);setq
		
		(setq txt-3 ;кол надписей
  		(entmakex
	  		(list
		   		'(0 . "TEXT")
		   		'(100 . "AcDbEntity")
		   		'(100 . "AcDbText")
		  		 (cons 10 pnt-ins-txt-3) ; нач точка текста
		  		 (cons 11 pnt-ins-txt-3) ; нач точка текста
		  		 (cons 1 "**") ; содержание текста
		   		'(40 . 2.5) ; высота текста
		   		'(41 . 1) ; растяжение текста
		   		'(50 . 0) ; поворот текста
		   		'(72 . 1) ; гориз выравнивание текста
		   		'(73 . 2) ; верт выравнивание текста
		   		'(370 . -1) ; толщина текста
		  		 (cons 7 (getvar "textstyle")) ; стиль текста
	  		);list
  		);entmakex
		);setq
		
		(setq ypnt-ins (+ ypnt-ins dlt-y-rctgl)
		);setq
	);progn
);repeat

(vla-endundomark adoc)
(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ )
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////