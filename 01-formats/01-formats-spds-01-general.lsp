;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:01-formats-spds-01-general

( / adoc block-name block-name-15 block-name-55 counter counter-1 data-format data-stamp dcl-id list-010 list-011 list-011-small list-012 list-013 list-0131 list-0132 list-014 
list-0141 list-0142 list-015 list-0151 list-0152 list-016 list-0161 list-0162 list-017 list-0171 list-0172 list-018 list-01-read-file list-02-read-file list-03-read-file 
name-block obj-1 part-okrch str-lft txt-011 type-list type-okrch)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;читаем марки чертежей
(read-file-for-dialog-box-01 "01-formats-spds-01-general-01-list-brands.txt" 2)

(setq list-011 list-01-read-file
			list-011-small list-02-read-file			
			list-010 nil			
			block-name nil			
			counter 0
);setq


;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм", "штамп-55мм-спдс-агсв" и т. д.
(repeat (length list-011-small)
	(setq block-name (strcat "штамп-55мм-спдс-" (nth counter list-011-small)));setq
	(if (tblsearch "block" block-name) (setq list-010 (vl-list* block-name list-010)));if
	(setq counter (1+ counter));setq
);repeat

(setq block-name nil
			counter 0
			counter-1 1
);setq

;формируем список из новых обозначенийтипа: "штамп-55мм-спдс-атм-1", "штамп-55мм-спдс-агсв-1" и т. д.
(repeat (length list-011-small)
	(repeat 50
		(setq block-name (strcat "штамп-55мм-спдс-" (nth counter list-011-small) "-" (itoa counter-1)));setq
		(if (tblsearch "block" block-name) (setq list-010 (vl-list* block-name list-010)));if
		(setq counter-1 (1+ counter-1));setq
	);repeat
	
	(setq counter-1 1
				counter (1+ counter)
	);setq
);repeat

(setq block-name nil
			list-010 (reverse list-010)
);setq

(setq list-012 (list "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11")
			list-018 (list "Штамп 15" "Штамп 55")
			txt-011 1 ;начальное значение штампа, по умолчанию штамп есть
);setq

(read-file-for-dialog-box-01 "01-formats-spds-01-general-list-a4.txt" 3)

(setq list-013 list-01-read-file
			list-0131 list-02-read-file
			list-0132 list-03-read-file
);setq

(read-file-for-dialog-box-01 "01-formats-spds-01-general-list-a3.txt" 3)

(setq list-014 list-01-read-file
			list-0141 list-02-read-file
			list-0142 list-03-read-file
);setq

(read-file-for-dialog-box-01 "01-formats-spds-01-general-list-a2.txt" 3)

(setq list-015 list-01-read-file
			list-0151 list-02-read-file
			list-0152 list-03-read-file
);setq

(read-file-for-dialog-box-01 "01-formats-spds-01-general-list-a1.txt" 3)

(setq list-016 list-01-read-file
			list-0161 list-02-read-file
			list-0162 list-03-read-file
);setq

(read-file-for-dialog-box-01 "01-formats-spds-01-general-list-a0.txt" 3)

(setq list-017 list-01-read-file
			list-0171 list-02-read-file
			list-0172 list-03-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-01-formats-spds-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_01_formats_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-010" list-010)
(list-filling "txt-011" list-011)
(list-filling "txt-012" list-012)
(list-filling "txt-013" list-013)
(list-filling "txt-0131" list-0131)
(list-filling "txt-014" list-014)
(list-filling "txt-0141" list-0141)
(list-filling "txt-015" list-015)
(list-filling "txt-0151" list-0151)
(list-filling "txt-016" list-016)
(list-filling "txt-0161" list-0161)
(list-filling "txt-017" list-017)
(list-filling "txt-0171" list-0171)
(list-filling "txt-018" list-018)

(if (> (length list-010) 1) (setq list-010 (reverse list-010)));if

;новая марка
(action_tile "but-010"
  (strcat "(01-formats-spds-general-new-stamp)");srcat
);action_tile

;кнопка включения или отключения штампа
(action_tile "but-011"
  (strcat "(mode_tile \"but-010\" 1)"
  				"(mode_tile \"txt-010\" 1)"
  				"(mode_tile \"txt-011\" 1)"
  				"(mode_tile \"txt-012\" 1)"
  				"(mode_tile \"txt-018\" 1)"
  				"(setq txt-011 0)"
  );strcat
);action_tile


;только штамп 55
(action_tile "but-012"
  (strcat "(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
  				"(setq type-list \"Только штамп 55\")"
  				"(done_dialog)"
  );srcat
);action_tile

;только штамп 15
(action_tile "but-013"
  (strcat "(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
  				"(setq type-list \"Только штамп 15\")"
  				"(done_dialog)"
  );srcat
);action_tile


;А4
(action_tile "txt-013"
	(strcat 
		"(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
		"(setq type-list (nth (atoi (get_tile \"txt-013\")) list-013))"
		"(setq name-block (nth (atoi (get_tile \"txt-013\")) list-0132))"
  	"(done_dialog)"
  );strcat
);action_tile

;А3
(action_tile "txt-014"
	(strcat 
		"(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
		"(setq type-list (nth (atoi (get_tile \"txt-014\")) list-014))"
		"(setq name-block (nth (atoi (get_tile \"txt-014\")) list-0142))"
  	"(done_dialog)"
  );strcat
);action_tile

;А2
(action_tile "txt-015"
	(strcat 
		"(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
		"(setq type-list (nth (atoi (get_tile \"txt-015\")) list-015))"
		"(setq name-block (nth (atoi (get_tile \"txt-015\")) list-0152))"
  	"(done_dialog)"
  );strcat
);action_tile

;А1
(action_tile "txt-016"
	(strcat 
		"(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
		"(setq type-list (nth (atoi (get_tile \"txt-016\")) list-016))"
		"(setq name-block (nth (atoi (get_tile \"txt-016\")) list-0162))"
  	"(done_dialog)"
  );strcat
);action_tile

;А0
(action_tile "txt-017"
	(strcat 
		"(setq block-name-55 (nth (atoi (get_tile \"txt-010\")) (reverse list-010)))"
		"(setq type-list (nth (atoi (get_tile \"txt-017\")) list-017))"
		"(setq name-block (nth (atoi (get_tile \"txt-017\")) list-0172))"
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

(setq block-name-15 (vl-string-subst "15мм" "55мм" block-name-55));setq

;если штампа 55мм в списке блоков нет, создаем обозначение штампа и сам штамп
(if (/= txt-011 0)
	(if (= (tblsearch "block" block-name-55) nil) 
		(progn
			(setq str-lft (substr block-name-55 17));setq
			
			(if (= (vl-string-search "-" str-lft) nil) 
				(setq type-okrch str-lft
							part-okrch nil
				);setq
			);if
			
			(if (/= (vl-string-search "-" str-lft) nil) 
				(setq type-okrch (substr str-lft 1 (vl-string-search "-" str-lft))
							part-okrch (substr str-lft (+ (vl-string-search "-" str-lft) 2))
				);setq
			);if
			
			(setq counter 0);setq
			
			(repeat (length list-011-small)
				(setq str-lft (nth counter list-011-small));setq	
				(if (= str-lft type-okrch) (setq type-okrch (nth counter list-011)));if
				(setq counter (1+ counter));setq
			);repeat
			
			(if (/= part-okrch nil) (setq type-okrch (strcat type-okrch "." part-okrch)));if
			
			(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-stamp-55mm-okrch.lsp") 
			(01-formats-spds-stamp-55mm-okrch block-name-55 type-okrch)
		);progn
	);if
);if


;если штампа 15мм в списке блоков нет, создаем обозначение штампа и сам штамп
(if (/= txt-011 0)
	(if (= (tblsearch "block" block-name-15) nil)
		(progn
			(command "_.-bedit" block-name-55)
			(setq	obj-1 (ssget "_c" '(0 55) '(-120 45) '((0 . "*TEXT"))));шифр документа
			(command "._bclose" ) ;"_s"
			(setq obj-1 (entget (ssname obj-1 0))
						type-okrch (cdr (assoc 1 obj-1))
						obj-1 nil
			);setq
			(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-stamp-15mm-okrch.lsp")
			(01-formats-spds-stamp-15mm-okrch block-name-15 type-okrch)
		);progn
	);if
);if


;рисуем форматы и штампы
(cond
	;;;;;;;;/////// только штамп 55мм
	((= type-list "Только штамп 55")	
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-only-stamp-55mm.lsp")				
		(01-formats-spds-only-stamp-55mm block-name-55)
	);=

	;;;;;;;;/////// только штамп 15мм
	((= type-list "Только штамп 15")	
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-only-stamp-15mm.lsp") 		
		(01-formats-spds-only-stamp-15mm block-name-15)
	);=
	
	;;;;;;;;/////// а4 лист 1 + штамп 55мм
	((= type-list "А4 лист 1 верт")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 297) 
														(cons 3 210) 
														(cons 4 "Формат А4")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=
	
	;;;;;;;;/////// а4 лист 2 + штамп 15мм
	((= type-list "А4 лист 2 верт")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

		(setq data-format (list (cons 1 name-block) 
														(cons 2 297) 
														(cons 3 210) 
														(cons 4 "Формат А4")) 
		);setq

		(01-formats-spds-02-page-2 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2-w-stamp-15mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-15) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-2-w-stamp-15mm data-stamp data-format)
	);=
	
	;;;;;;;;/////// а4x3 лист 1 + штамп 55мм
	((= type-list "А4х3 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 297) 
														(cons 3 630) 
														(cons 4 "Формат А4х3")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=
	
	
	;;;;;;;;/////// а3 лист 1 + штамп 55мм
	((= type-list "А3 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 297) 
														(cons 3 420) 
														(cons 4 "Формат А3")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=	

	
	;;;;;;;;/////// а3 лист 2 + штамп 15мм
	((= type-list "А3 лист 2 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

		(setq data-format (list (cons 1 name-block) 
														(cons 2 297) 
														(cons 3 420) 
														(cons 4 "Формат А3")) 
		);setq

		(01-formats-spds-02-page-2 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2-w-stamp-15mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-15) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-2-w-stamp-15mm data-stamp data-format)
	);=
	
	
	;;;;;;;;/////// а2 лист 1 + штамп 55мм
	((= type-list "А2 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 420) 
														(cons 3 594) 
														(cons 4 "Формат А2")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=	

	
	;;;;;;;;/////// а2 лист 2 + штамп 15мм
	((= type-list "А2 лист 2 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

		(setq data-format (list (cons 1 name-block) 
														(cons 2 420) 
														(cons 3 594) 
														(cons 4 "Формат А2")) 
		);setq

		(01-formats-spds-02-page-2 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2-w-stamp-15mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-15) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-2-w-stamp-15mm data-stamp data-format)
	);=	


	;;;;;;;;/////// а1 лист 1 + штамп 55мм
	((= type-list "А1 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 594) 
														(cons 3 841) 
														(cons 4 "Формат А1")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=	

	
	;;;;;;;;/////// а1 лист 2 + штамп 15мм
	((= type-list "А1 лист 2 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

		(setq data-format (list (cons 1 name-block) 
														(cons 2 594) 
														(cons 3 841) 
														(cons 4 "Формат А1")) 
		);setq

		(01-formats-spds-02-page-2 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2-w-stamp-15mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-15) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-2-w-stamp-15mm data-stamp data-format)
	);=


	;;;;;;;;/////// а1х3 лист 1 + штамп 55мм
	((= type-list "А1х3 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 841) 
														(cons 3 1783) 
														(cons 4 "Формат А1х3")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=	


	;;;;;;;;/////// а0 лист 1 гориз + штамп 55мм
	((= type-list "А0 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 841) 
														(cons 3 1189) 
														(cons 4 "Формат А0")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=	

	
	;;;;;;;;/////// а0 лист 2 гориз  + штамп 15мм
	((= type-list "А0 лист 2 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

		(setq data-format (list (cons 1 name-block) 
														(cons 2 841) 
														(cons 3 1189) 
														(cons 4 "Формат А0")) 
		);setq

		(01-formats-spds-02-page-2 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2-w-stamp-15mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-15) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-2-w-stamp-15mm data-stamp data-format)
	);=	

	;;;;;;;;/////// а0 лист 1 верт + штамп 55мм
	((= type-list "А0 лист 1 верт")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 1189) 
														(cons 3 841) 
														(cons 4 "Формат А0")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=

	;;;;;;;;/////// а0х2 лист 1 + штамп 55мм
	((= type-list "А0х2 лист 1 гориз")
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")
		
		(setq data-format (list (cons 1 name-block) 
														(cons 2 1189) 
														(cons 3 1682) 
														(cons 4 "Формат А0х2")) 
		);setq

		(01-formats-spds-02-page-1 data-format)
		
		(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1-w-stamp-55mm.lsp")
		
		(setq data-stamp (list (cons 1 block-name-55) 
													 (cons 2 txt-011))
		);setq
		
		(01-formats-spds-02-page-1-w-stamp-55mm data-stamp data-format)
	);=
);cond

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
;/////// создание нового комплекта                                    //////////////////////////////////////////////////////////////////////
(defun 01-formats-spds-general-new-stamp

( / new-block-name part-012 part-013 str-010)

(setq part-012 (nth (atoi (get_tile "txt-011")) list-011-small)
			part-013 (nth (atoi (get_tile "txt-012")) list-012)
);setq

(cond
	((/= part-013 "Нет") (setq new-block-name (strcat "штамп-55мм-спдс-" part-012 "-" part-013)));=
	((= part-013 "Нет") (setq new-block-name (strcat "штамп-55мм-спдс-" part-012)));=
);cond

(setq list-010 (vl-list* new-block-name list-010)
			list-010 (reverse list-010)
);setq

(list-filling "txt-010" list-010)

(setq str-010 (itoa (1- (length list-010)))
      list-010 (reverse list-010)
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////