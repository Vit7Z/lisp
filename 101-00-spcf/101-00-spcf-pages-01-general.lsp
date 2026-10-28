;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// название программы****************                           //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
(defun c:101-00-spcf-pages-01-general

( / adoc block-name-15 block-name-okrch block-name-spcf counter counter-1 counter-2 data-format dcl-id file-open list-01 list-012 
list-012-small list-02 list-03 path-file-open pnt-ins pnt-ins-head pnt-ins-stamp pnt-txt32 stamp-15-spcf stamp-55-spcf str-f str-lft-01 
str-lft-02 txt-32 type-act x-pnt-ins y-pnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;создаем блок заголовка ЗС, если его нет в чертеже
(if (= (tblsearch "block" "зс-шапка" ) nil)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\101-00-spcf\\101-00-spcf-pages-header.lsp")
		(101-00-spcf-pages-header)
	);progn
);if

(load "d:\\yandexdisk\\my-sprt\\101-00-spcf\\101-00-spcf-stamp-15mm.lsp")

;создаем блок А3 лист 1, если его нет в чертеже
(if (= (tblsearch "block" "а3-спдс-лист-2-гориз") nil)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")		
		(setq data-format (list (cons 1 "а3-спдс-лист-1-гориз") 
														(cons 2 297) 
														(cons 3 420) 
														(cons 4 "Формат А3")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
	);progn
);if

;создаем блок А3 лист 2, если его нет в чертеже
(if (= (tblsearch "block" "а3-спдс-лист-2-гориз") nil)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")		
		(setq data-format (list (cons 1 "а3-спдс-лист-2-гориз") 
														(cons 2 297) 
														(cons 3 420) 
														(cons 4 "Формат А3")) 
		);setq
		
		(01-formats-spds-02-page-2 data-format)
	);progn
);if

;читаем марки чертежей из файла
(setq str-f 1
			str-lft-01 nil
			str-lft-02 nil
);setq






(setq path-file-open (findfile "01-formats-spds-01-general-01-list-brands.txt");открываем файл
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
	(setq str-f (read-line file-open));читаем строку

	(if (/= str-f nil) 
		(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
					str-lft-02 (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\	
					list-012 (vl-list* str-lft-01 list-012);создаем список из считанных строк из файла
					list-012-small (vl-list* str-lft-02 list-012-small)
		);setq
	);if
);while

(setq list-012 (reverse list-012)
			list-012-small (reverse list-012-small)
);setq

(setq counter 1
			list-01 nil ;список марок чертежей
			list-02 nil ;список спецификаций
			list-03 (list "1" "2" "3" "4" "5" "6" "7")
);setq


;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм", "штамп-55мм-спдс-атм-спцф" и т. д.
(setq counter 0);setq

(repeat (length list-012-small)
	(setq block-name-okrch (strcat "штамп-55мм-спдс-" (nth counter list-012-small))
				block-name-spcf (strcat block-name-okrch "-спцф")
	);setq
	
	(if (tblsearch "block" block-name-okrch) 
		(setq list-01 (vl-list* block-name-okrch list-01))
	);if

	(if (tblsearch "block" block-name-spcf) 
		(setq list-02 (vl-list* block-name-spcf list-02))
	);if
	
	(setq counter (1+ counter));setq
);repeat


;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм-спцф-1" и т. д.
(setq counter 0
			counter-1 1
);setq

(repeat (length list-012-small)
	(repeat 20		
		(setq block-name-spcf (strcat "штамп-55мм-спдс-" (nth counter list-012-small) "-спцф-" (itoa counter-1)));setq
		
		(if (tblsearch "block" block-name-spcf) (setq list-02 (vl-list* block-name-spcf list-02)));if
		(setq counter-1 (1+ counter-1))
	);repeat
	
	(setq counter (1+ counter)
				counter-1 1
	);setq
);repeat

;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм-1-спцф", "штамп-55мм-спдс-агсв-1-спцф"и т. д.
(setq counter 0
			counter-1 1
);setq

(repeat (length list-012-small)
	(repeat 20
		(setq block-name-spcf (strcat "штамп-55мм-спдс-" (nth counter list-012-small) "-" (itoa counter-1) "-спцф"));setq	
		(if (tblsearch "block" block-name-spcf) (setq list-02 (vl-list* block-name-spcf list-02)));if
		(setq counter-1 (1+ counter-1));setq
	);repeat
	
	(setq counter-1 1
				counter (1+ counter)
	);setq
);repeat


;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм-1", "штамп-55мм-спдс-агсв-1", "штамп-55мм-спдс-атм-1-спцф-1", "штамп-55мм-спдс-агсв-1-спцф-1"и т. д.
(setq counter 0
			counter-1 1
			counter-2 1
);setq

(repeat (length list-012-small)
	(repeat 20
		(setq block-name-okrch (strcat "штамп-55мм-спдс-" (nth counter list-012-small) "-" (itoa counter-1)));setq
		
		(if (tblsearch "block" block-name-okrch) (setq list-01 (vl-list* block-name-okrch list-01)));if
		
		(repeat 10
			(setq block-name-spcf (strcat "штамп-55мм-спдс-" (nth counter list-012-small) "-" (itoa counter-1) "-спцф-" (itoa counter-2)));setq
			(if (tblsearch "block" block-name-spcf) (setq list-02 (vl-list* block-name-spcf list-02)));if
			(setq counter-2 (1+ counter-2));setq
		);repeat
		
		(setq counter-2 1
					counter-1 (1+ counter-1)
		);setq
	);repeat
	
	(setq counter-1 1
				counter (1+ counter)
	);setq
);repeat





(if (< (setq dcl-id (load_dialog "dia-101-00-spcf-pages-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_00_spcf_pages_01_general" dcl-id))
		(exit)
);if

(setq list-01 (vl-sort list-01 '<)
      list-02 (vl-sort list-02 '<)
			list-012-small (vl-sort list-012-small '<)
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

;(set_tile "txt-01" "0")
;(set_tile "txt-03" "0")

(action_tile "but-01"
  (strcat "(but-01-101-00-spcf-pages)");strcat
);action_tile

(action_tile "but-02"
  (strcat  	
  	"(setq stamp-55-spcf (nth (atoi (get_tile \"txt-02\")) list-02))";setq, имя блока штампа спецификации
  	"(setq type-act \"but-02\")"
  	"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-03"
  (strcat 
  	"(setq stamp-15-spcf (nth (atoi (get_tile \"txt-02\")) list-02))";setq
  	"(setq stamp-15-spcf (vl-string-subst \"15мм\" \"55мм\" stamp-15-spcf))"
  	"(setq type-act \"but-03\")";setq
  	"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
  				"(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= type-act "but-02") ;страница А3 + штамп 55 мм
	(progn
		(load "d:\\yandexdisk\\my-sprt\\101-00-spcf\\101-00-spcf-stamp-55mm.lsp")
		(load "d:\\yandexdisk\\my-sprt\\101-00-spcf\\101-00-spcf-stamp-15mm.lsp")
		(setvar	"osmode" 0)		
		(setvar	"cmdecho" 0)
		
		(if (= (tblsearch "block" stamp-55-spcf) nil)
		  (progn
        (101-00-spcf-stamp-55mm stamp-55-spcf)
        (setq stamp-15-spcf (vl-string-subst "15мм" "55мм" stamp-55-spcf))
        (101-00-spcf-stamp-15mm stamp-15-spcf)
      );progn
    );if
		
		(setvar	"osmode" 0)		
		(setvar	"cmdecho" 0)
		(load "d:\\yandexdisk\\my-sprt\\101-00-spcf\\101-00-spcf-pages-1.lsp")
		
		(101-00-spcf-page-1 stamp-55-spcf)	
	);progn
);=if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= type-act "but-03");страница А3 + штамп 15 мм
	(progn			
		(setvar	"osmode" 6199)

		(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
			(setq x-pnt-ins (nth 0 pnt-ins)
						y-pnt-ins (nth 1 pnt-ins)
				
						pnt-ins (list x-pnt-ins y-pnt-ins)
						pnt-ins-stamp (list (+ x-pnt-ins 455) (+ y-pnt-ins 5))
						pnt-ins-head (list (+ x-pnt-ins 60) (+ y-pnt-ins 292))
						pnt-txt32 (list (+ x-pnt-ins 450) (+ y-pnt-ins 9))
			);setq
				
			(setvar "osmode" 0)	
				
			(command "_insert" "а3-спдс-лист-2-гориз" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins) ; если блок существует
			(command "_insert" stamp-15-spcf "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp) ; вставка блока
			(command "_insert" "зс-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head) ; если блок существует
				
			(setq txt-32
				(entmakex
					(list
						'(0 . "TEXT")
						'(100 . "AcDbEntity")
						'(100 . "AcDbText")
						(cons 10 pnt-txt32) ; нач точка текста
						(cons 11 pnt-txt32) ; нач точка текста
						'(1 . "**") ; содержание текста
						'(40 . 3.5) ; высота текста
						'(41 . 1) ; растяжение текста
						'(50 . 0) ; поворот текста
						'(72 . 1) ; гориз выравнивание текста
						'(73 . 2) ; верт выравнивание текста
						'(370 . -1) ; толщина текста
						(cons 7 (getvar "textstyle")) ; стиль текста
					);list
				);entmakex
			);setq
		
			(setvar	"osmode" 6199)
		);while
	);progn
);if

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////
(defun but-01-101-00-spcf-pages

( / new-block-name str-01 str-02 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq
 
(cond 
	((= str-03 "Нет") (setq str-03 ""));=
	((/= str-03 "Нет") (setq str-03 (strcat "-" str-03)));=
);if

(setq new-block-name (strcat str-01 "-спцф" str-03)
			list-02 (vl-list* new-block-name (reverse list-02))			
			list-02 (reverse list-02)
);setq

(list-filling "txt-02" list-02)

(setq str-02 (itoa (1- (length list-02))));setq

(set_tile "txt-02" str-02)

(gc)
(princ)
)
;///////                                                              //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
