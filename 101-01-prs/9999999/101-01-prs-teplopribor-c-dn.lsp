;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-teplopribor-c-dn

( / adoc dcl-id list-01 list-02 list-1001 list-1001-read-file list-901 list-902 list-902-read-file list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
      list-902-read-file nil
      list-1001-read-file nil
);setq

(read-file-for-dialog-box-01 "101-01-press-sens-teplopribor-c-dn.txt")

(divide-text-into-parts-02-list-text list-1001-read-file 65)

(setq list-01 (cdr (assoc 1 list-902-read-file))
			list-02 (cdr (assoc 2 list-902-read-file))
			list-99 (cdr (assoc 3 list-902-read-file))
			list-1001 list-1001-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-teplopribor-c-dn.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_spz_dg" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-press-sens-teplopribor-c-dn)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
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

(if (= type-list "le") (tmp-le-101-01-press-sens-teplopribor-c-dn));if

(if (= type-list "spcf") (tmp-spcf-101-01-press-sens-teplopribor-c-dn));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-01-press-sens-teplopribor-c-dn

( / str-01 str-02 str-902 str-99 swtch)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-902 (list (cons 1 str-01) (cons 2 str-02)(cons 99 str-99))
  		list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  		
  		list-901 (vl-list* (strcat str-01 "   "
  															 str-02 "кПа") list-901)
);setq


(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-press-sens-teplopribor-c-dn

( / cntr-1 pnt-ins str-01 str-02 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= (substr str-01 1 2) "ДН")
		(setq str-txt (strcat "Датчики-реле напора " str-01 ", пределы уставок " str-02 "кПа, присоединение резьба М12х1,5 (наружн.)")
					str-txt-01 nil	
		);setq
	);if
	
	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-01-press-sens-teplopribor-c-dn

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))

				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= (substr str-01 1 2) "ДН")
		(progn
			(setq nmbr-ln 4);setq
					
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Датчик-реле давления (напора)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- пределы уставок " str-02 "кПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- присоединение резьба М12х1,5 (наружняя)")
		);progn
	);if
		
	(split-str-parts-spcf-60-01 str-01 nil pnt-ins)
			
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО \"Завод")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "\"Теплоприбор-Комплект\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Улан-Удэ")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса	
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
