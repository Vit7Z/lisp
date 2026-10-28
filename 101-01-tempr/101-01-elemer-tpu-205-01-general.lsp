;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-elemer-tpu-205-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-21 list-22 list-23 list-24 
list-25 list-26 list-27 list-28 list-29 list-30 list-31 list-32 list-801 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "101-01-elemer-tpu-205-01-general.txt" 2)

(setq list-01 list-01-read-file
      list-801 list-02-read-file

      list-901 nil
      list-902 nil
      
      str-01 "0"
);setq

(txt-01-101-01-elemer-tpu-205-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-elemer-tpu-205-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_elemer_tpu_205" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(action_tile "txt-01" 
	(strcat "(setq str-01 (get_tile \"txt-01\"))"
					"(txt-01-101-01-elemer-tpu-205-01-general str-01)"
	);strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-elemer-tpu-205-01-general)");srcat
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

(if (= type-list "le") (le-101-01-elemer-tpu-205-01-general list-902));if

(if (= type-list "spcf") (spcf-101-01-elemer-tpu-205-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-elemer-tpu-205-01-general
(str-01 / list-900-dscr list-902-read-file name-file)

(setq name-file (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file)

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-06 (cdr (nth 4 list-902-read-file))
			list-07 (cdr (nth 5 list-902-read-file))
			list-08 (cdr (nth 6 list-902-read-file))
			list-09 (cdr (nth 7 list-902-read-file))
			list-10 (cdr (nth 8 list-902-read-file))
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-900" list-900)


(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-elemer-tpu-205-01-general

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-99 str-connection str-design str-order tmp-list-902)

(setq cntr-1 0);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			
			str-order (strcat str-01 "-" str-02 "-" str-03 "-" str-04 "-" str-05 "-" str-06 "-" str-07 "-" str-08 "-" str-09 "-" str-10 "-/-/")

			list-901 (vl-list* str-order list-901)
);setq

(cond 
	((< (atoi str-07) 100) (setq str-99 "0,6"))
	((and (>= (atoi str-07) 100) (< (atoi str-07) 120)) (setq str-99 "0,8"))
	((and (>= (atoi str-07) 160) (<= (atoi str-07) 500)) (setq str-99 "1,2"))
);cond

(cond 
	((wcmatch str-01 "*-/-*") (setq str-design "общепром. исполнение"))
);cond

(cond 
	((wcmatch str-01 "*-1088/8БГ") (setq str-connection "присоединение М20х1,5 (наружн.)"))
);cond

(setq tmp-list-902 (list (cons 1 "Термопреобразователь с унифицированным выходным сигналом")
												 (cons 2 str-order)
												 (cons 3 (strcat "диапазон изм. " str-06))
												 (cons 4 (strcat "НСХ " str-05))
												 (cons 5 (strcat "Lпогр. " str-07 "мм"))
												 (cons 6 str-connection)
												 (cons 7 (strcat "диаметр монтажн. части " str-08 "мм"))
												 (cons 8 str-design)

									 			 (cons 99 str-99));list
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-elemer-tpu-205-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-05 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-702 nil
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	(setvar "osmode" 0)
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat str-01 " ЭЛЕМЕР " str-02 ", " str-05 ", " str-06));setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "*22*");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-elemer-tpu-205-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 str-01
	
				str-702 (list (cons 1 str-03)
											(cons 2 str-04)
											(cons 3 str-05)
											(cons 4 str-06)
											(cons 5 str-07)
											(cons 6 str-08)
											);list
	);setq
		
	(setq str-order (list (cons 1 str-02)
									(cons 2 "-")
									(cons 3 "НКГЖ.411611.009 ТУ"));list
									
				str-manufact "ООО НПП \"ЭЛЕМЕР\", г. Зеленоград"
				str-unit "шт."
				str-crtf "Свид. об утв. типа СИ №77901"
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
