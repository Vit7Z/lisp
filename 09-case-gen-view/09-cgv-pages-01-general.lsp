;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// организация листов ЭЧНИ и ОВШ                                //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
(defun c:09-cgv-pages-01-general

( / adoc blockset datablock data-format dcl-id i list-01 list-02 list-03 list-10 nameblock pnt-ins pnt-ins-head pnt-ins-stamp pnt-txt32 
stamp-15-lecgv stamp-55-lecgv tmpsection txt-32 type-act x-pnt-ins y-pnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 0)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;создаем блок А4 лист 1, если его нет в чертеже
(if (= (tblsearch "block" "а4-спдс-лист-1-верт") nil)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")		
		(setq data-format (list (cons 1 "а4-спдс-лист-1-верт") 
														(cons 2 297) 
														(cons 3 210) 
														(cons 4 "Формат А4")) 
		);setq
		(01-formats-spds-02-page-1 data-format)
	);progn
);if


;создаем блок А4 лист 2, если его нет в чертеже
(if (= (tblsearch "block" "а4-спдс-лист-2-верт") nil)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")		
		(setq data-format (list (cons 1 "а4-спдс-лист-2-верт") 
														(cons 2 297) 
														(cons 3 210) 
														(cons 4 "Формат А4")) 
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

;формируем набор из блоков типа: штамп-55мм-спдс-
(setq blockSet (ssget "_x" '((0 . "INSERT") (2 . "штамп-55мм-спдс-*")))
      list-01 nil
      list-02 (list "1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
      list-03 nil
      i 0
);setq

(if (= blockSet nil)
  (progn
    (alert "Штампов ОКРЧ нет!");setq
    (exit)
  );progn
);if

;формируем наборы из блоков штамп-55мм-спдс-атх-... и штамп-55мм-спдс-атх-...эчни
(repeat	(sslength blockSet)
	(setq dataBlock (entget (ssname blockSet i))	
	      nameBlock (cdr (assoc 2 dataBlock))
	);setq
	
	(if (and (not (vl-string-search "спцф" nameBlock)) (not (vl-string-search "эчни" nameBlock)))
    (setq list-01 (vl-list* nameBlock list-01));setq
  );if
	
  (if (vl-string-search "эчни" nameBlock)
	  (progn
	    (setq tmpSection (substr nameBlock (vl-string-search "эчни" nameBlock) 6));setq
	    (if (= tmpSection "-эчни-")
	      (setq list-03 (vl-list* nameBlock list-03));setq
      );if
	  );progn
	);if
  (setq i (+ i 1));setq
);repeat

(remove-dup-09-cgv-pages-01-general list-01)
(setq list-01 list-10);setq

(remove-dup-09-cgv-pages-01-general list-03)
(setq list-03 list-10);setq

(if (< (setq dcl-id (load_dialog "dia-09-cgv-pages-01-general.dcl")) 0) ;ищем диалог
  (progn
	  (alert "Не найден dcl-файл")
		(exit)
  );progn
);if

(if (not (new_dialog "dia_09_cgv_pages_01_general" dcl-id))
  (exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(action_tile "but-01"
  (strcat "(but-01-09-cgv-pages-01-general)");strcat
);action_tile

(action_tile "but-02"
  (strcat  	
  	"(setq stamp-55-lecgv (nth (atoi (get_tile \"txt-03\")) list-03))";setq, имя блока штампа спецификации
  	"(setq type-act \"but-02\")"
  	"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-03"
  (strcat 
  	"(setq stamp-15-lecgv (nth (atoi (get_tile \"txt-03\")) list-03))";setq
  	"(setq stamp-15-lecgv (vl-string-subst \"15мм\" \"55мм\" stamp-15-lecgv))"
  	"(setq type-act \"but-03\")";setq
  	"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-04"
  (strcat 
  	"(setq stamp-15-lecgv (nth (atoi (get_tile \"txt-03\")) list-03))";setq
  	"(setq stamp-15-lecgv (vl-string-subst \"15мм\" \"55мм\" stamp-15-lecgv))"
  	"(setq type-act \"but-04\")";setq
  	"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)");strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)


(setvar "osmode" 0)

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= type-act "but-02") ;А4 лист 1 + штамп 55 мм
	(progn
		(load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-stamp-55mm-spds.lsp")
		(load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-stamp-15mm-spds.lsp")
		(setvar	"osmode" 0)		
		(setvar	"cmdecho" 0)
		
		(if (= (tblsearch "block" stamp-55-lecgv) nil)
		  (progn
        (09-cgv-stamp-55mm-spds stamp-55-lecgv)
        (setq stamp-15-lecgv (vl-string-subst "15мм" "55мм" stamp-55-lecgv))
        (09-cgv-stamp-15mm-spds stamp-15-lecgv)
      );progn
    );if
		
		(setvar	"osmode" 0)		
		(setvar	"cmdecho" 0)
		(load "d:\\YandexDisk\\my-sprt\\09-case-gen-view\\09-cgv-pages-1.lsp")
		
		(09-cgv-pages-1 stamp-55-lecgv)	
	);progn
);=if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= type-act "but-03");А4 лист 2 + штамп 15 мм
	(progn
		(load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-stamp-15mm-spds.lsp")
		(09-cgv-stamp-15mm-spds stamp-15-lecgv)
		(setvar "cmdecho" 0)
		(setvar "osmode" 6199)

		(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
			(setq x-pnt-ins (nth 0 pnt-ins)
						y-pnt-ins (nth 1 pnt-ins)
			
						pnt-ins (list x-pnt-ins y-pnt-ins)
						pnt-ins-stamp (list (+ x-pnt-ins 245) (+ y-pnt-ins 5))
						pnt-ins-head (list (+ x-pnt-ins 245) (+ y-pnt-ins 292))
					 
						pnt-txt32 (list (+ x-pnt-ins 240) (+ y-pnt-ins 9))
			);setq
				
			(setvar "osmode" 0)
				
			(command "_insert" "а4-спдс-лист-2-верт" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins);если блок существует
			(command "_insert" "чро-шапка-спцф" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head);если блок существует
			(command "_insert" stamp-15-lecgv "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp);вставка блока
				
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


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= type-act "but-04")
	(progn
		(load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-stamp-15mm-spds.lsp")
		(09-cgv-stamp-15mm-spds stamp-15-lecgv)
		(setvar "cmdecho" 0)
		(setvar "osmode" 6199)

		(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
			(setq x-pnt-ins (nth 0 pnt-ins)
						y-pnt-ins (nth 1 pnt-ins)
			);setq
				
			(setq pnt-ins (list x-pnt-ins y-pnt-ins)
						pnt-ins-stamp (list (+ x-pnt-ins 455) (+ y-pnt-ins 5))				 
						pnt-txt32 (list (+ x-pnt-ins 450) (+ y-pnt-ins 9))
			);setq
				
			(setvar "osmode" 0)
				
			(command "_insert" "а3-спдс-лист-2-гориз" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins);если блок существует
			(command "_insert" stamp-15-lecgv "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp);вставка блока
				
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
;/////// удаление дубликата из списка и сортировка по возрастанию     //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
(defun remove-dup-09-cgv-pages-01-general

(list-tmp / i num-1 num-2)

(setq i 0
      list-10 nil
);setq

(repeat (length list-tmp)
	(setq num-1 (nth i list-tmp));setq
	
	(if (/= num-1 nil) 
	  (setq list-10 (vl-list* num-1 list-10)
	        list-tmp (subst nil num-1 list-tmp)
		);setq
	);if
	(setq i (+ i 1));setq
);repeat

(setq list-10 
	(vl-sort list-10
		(function (lambda (num-1 num-2) 
			(< num-1 num-2))
    );fun
  );vl-sort
);setq

(gc)
(princ)
)
;////////************************************************************///////////////////////////////////////////////////////////////////////
;////////************************************************************///////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////
(defun but-01-09-cgv-pages-01-general

( / new-block-name str-01 str-02 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq
 
(setq new-block-name (strcat str-01 "-эчни-" str-02)
			list-03 (vl-list* new-block-name (reverse list-03))			
			list-03 (reverse list-03)
);setq

(list-filling "txt-03" list-03)

(setq str-03 (itoa (1- (length list-03))));setq

(set_tile "txt-03" str-03)

(gc)
(princ)
)
;///////                                                              //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////




