;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-other-owen

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-1001 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      
			str-01 nil
);setq

(read-file-for-dialog-box "101-04-other-owen-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(tmp-start-1-101-04-other-owen)

(if (< (setq dcl-id (load_dialog "dia-101-04-other-owen.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_other_owen" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(tmp-start-1-101-04-other-owen)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-other-owen)");strcat
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

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile


(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-04-other-owen));if
(if (= type-list "spcf") (tmp-spcf-101-04-other-owen));if
(if (= type-list "lecgv") (tmp-lecgv-101-04-other-owen));if

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
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-1-101-04-other-owen

( / htxt-list list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-1001-read-file name-file-1 num-flds)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file-1 (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(cond
	((= str-01 "Вентилятор")
		(setq htxt-list (list "Размеры," "ШxВ, мм" ""
													"Мощность" "воздушного" "потока, м3/ч"
													"Эл. питание" "" ""
													"Потр." "мощность," "Вт"));setq
	);=

	((= str-01 "Термостат для шкафа")
		(setq htxt-list (list "Назначение" "" "" 
													"" "" "" 
													"" "" ""
													"" "" ""));setq
	);=

	((= str-01 "Решетка")
		(setq htxt-list (list "Размеры," "ШxВ, мм" ""
													"" "" "" 
													"" "" ""
													"" "" ""));setq
	);=
);cond

(set_tile "ptxt-031" (nth 0 htxt-list))
(set_tile "ptxt-032" (nth 1 htxt-list))
(set_tile "ptxt-033" (nth 2 htxt-list))

(set_tile "ptxt-041" (nth 3 htxt-list))
(set_tile "ptxt-042" (nth 4 htxt-list))
(set_tile "ptxt-043" (nth 5 htxt-list))

(set_tile "ptxt-051" (nth 6 htxt-list))
(set_tile "ptxt-052" (nth 7 htxt-list))
(set_tile "ptxt-053" (nth 8 htxt-list))

(set_tile "ptxt-061" (nth 9 htxt-list))
(set_tile "ptxt-062" (nth 10 htxt-list))
(set_tile "ptxt-063" (nth 11 htxt-list))

(read-file-for-dialog-box name-file-1 num-flds)

(divide-text-into-parts-02-list-text list-1001-read-file 140)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-99 list-06-read-file
			list-1001 list-1001-read-file
);setq

(cond
	((= str-01 "Термостат для шкафа")
		(setq list-99 list-03-read-file
					list-04 nil
		);setq
	);=

	((= str-01 "Решетка")
		(setq list-99 list-03-read-file
					list-04 nil
		);setq
	);=
);cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-other-owen

( / str-01 str-02 str-03 str-04 str-05 str-06 str-99 tmp-list-902 tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);
);if

(if (= "Вентилятор" str-01) 
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "м3/ч  " str-05 "В  " str-06 "Вт") list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
	);setq
);if

(if (= "Термостат для шкафа" str-01) 
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(if (= "Решетка" str-01) 
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "мм (ВхШ)") list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(setq list-902 (vl-list* tmp-str-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-other-owen

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Вентилятор")
		(setq str-701 (strcat "Вентилятор, " str-02 ", Uпит. " str-05 ", воздушный поток " str-04 "м3/ч, размеры (ВхШ) " str-03 "мм")
					str-702 nil
		);setq
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Термостат для шкафа")
		(progn
			(cond
				((= str-03 "Охлаждение") (setq str-03 "вентилятором"));=
				((= str-03 "Нагрев") (setq str-03 "нагревателем"));=
				((= str-03 "Охлаждение, нагрев") (setq str-03 "вентилятором и нагревателем"));=
			);cond
	
			(setq str-701 (strcat "Термостат, " str-02 ", для управления " str-03)
						str-702 nil
			);setq
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Решетка")
		(setq str-701 (strcat "Решетка (выпускная), " str-02 ", размеры (ВхШ) " str-03 "мм")
					str-702 nil
		);setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-other-owen

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-not str-patrn str-tmp str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
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

	;///////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Вентилятор")
		(progn		
			(setq nmbr-ln 3
						str-txt str-02 
						str-not nil
						str-patrn " "
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)			
			;
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Вентилятор (микроклимат эл. технического шкафа)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uпит. " str-05 ", воздушный поток " str-04 "м3/ч, размеры (ВхШ) " str-03 "мм"))
		);progn
	);if

	;///////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Термостат для шкафа")
		(progn		
			(setq nmbr-ln 3
						str-txt str-02
						str-not nil
						str-patrn " "
			);setq

			(cond
				((= str-03 "Охлаждение") (setq str-03 "вентилятором"));=
				((= str-03 "Нагрев") (setq str-03 "нагревателем"));=
				((= str-03 "Охлаждение, нагрев") (setq str-03 "вентилятором и нагревателем"));=
			);cond
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)			
			;
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Термостат (микроклимат эл. технического шкафа)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- для управления " str-03))
		);progn
	);if

	;///////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Решетка")
		(progn		
			(setq nmbr-ln 3
						str-txt str-02
						str-not nil
						str-patrn " "
			);setq

			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)			
			;
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Решетка (микроклимат эл. технического шкафа)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- выпускная, размеры (ВхШ) " str-03 "мм"))
		);progn
	);if


	
	(split-str-parts-spcf-60-01 str-txt str-not str-patrn pnt-ins);
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ОВЕН, г. Москва")

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
	
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

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-other-owen

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Вентилятор" str-01)
		(setq str-701 (strcat "Вентилятор (микроклимат эл. технического шкафа), " str-02 ", Uпит. " str-05 ", воздушный поток " str-04 "м3/ч, размеры (ВхШ) " str-03 "мм")
					str-702 nil
					str-703 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (= "Термостат для шкафа" str-01)
		(progn
			(cond
				((= str-03 "Охлаждение") (setq str-03 "вентилятором"));=
				((= str-03 "Нагрев") (setq str-03 "нагревателем"));=
				((= str-03 "Охлаждение, нагрев") (setq str-03 "вентилятором и нагревателем"));=
			);cond
			
			(setq str-701 (strcat "Термостат (микроклимат эл. технического шкафа) " str-02 ", для управления " str-03)
						str-702 nil
						str-703 nil
			);setq
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Решетка" str-01)
		(setq str-701 (strcat "Решетка (микроклимат эл. технического шкафа, выпускная), " str-02 ", размеры (ВхШ) " str-03 "мм")
					str-702 nil
					str-703 nil
		);setq
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////