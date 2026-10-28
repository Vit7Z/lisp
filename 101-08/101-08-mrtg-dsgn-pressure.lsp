;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mrtg-dsgn-pressure

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-07 list-08 list-1001 list-801 
list-802 list-803 list-900 list-900-dscr list-900-menu list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-08-mrtg-dsgn-pressure-01-general.txt" 4)

(setq list-01 list-01-read-file
			list-801 list-02-read-file ;список файлов
			list-802 list-03-read-file ;список полей, которые надо читать
			list-803 list-04-read-file ;список назначений
			
			list-901 nil
      list-902 nil
      list-900 nil
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-08-mrtg-dsgn-pressure str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-mrtg-dsgn-pressure.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_mrtg_dsgn_pressure" dcl-id))
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
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-08-mrtg-dsgn-pressure str-01)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-04\" $value)"
			 		"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-03\" $value)"
			 		"(set_tile \"txt-05\" $value)"
			 		"(set_tile \"txt-06\" $value)"
			 		"(set_tile \"txt-07\" $value)"
			 		"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-06"
  (strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile


(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-mrtg-dsgn-pressure)");strcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-08-mrtg-dsgn-pressure list-902));if
(if (= type-list "spcf") (tmp-spcf-101-08-mrtg-dsgn-pressure list-902));if
(if (= type-list "lecgv") (tmp-lecgv-101-08-mrtg-dsgn-pressure list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;подпрогамма чтения данных из файлов/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-mrtg-dsgn-pressure

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-900-dscr list-900-read-file name-file-1 num-flds str-02)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
			str-02 (nth (atoi str-01) list-803)
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(divide-text-into-parts (list str-02) 30)

(setq list-02 list-900-read-file
			list-03 list-01-read-file
      list-04 list-02-read-file
      list-05 list-03-read-file
      list-06 list-04-read-file
      list-07 list-05-read-file
      list-08 list-06-read-file
      list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-900" list-900)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;подпрогамма чтения данных из файлов/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-08-mrtg-dsgn-pressure

( / str-03)

(setq str-03 (get_tile "txt-03"));setq

(set_tile "txt-04" str-03)
(set_tile "txt-05" str-03)
(set_tile "txt-06" str-03)
(set_tile "txt-07" str-03)
(set_tile "txt-08" str-03)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-mrtg-dsgn-pressure

( / cntr-1 str-01 str-02 str-02-tmp str-03 str-04 str-05 str-06 str-07 str-08 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)

		str-03 (nth (atoi (get_tile "txt-03")) list-03)
		str-03 (strcat "Pу до " str-03 "МПа")
		
		str-04 (nth (atoi (get_tile "txt-04")) list-04)
		str-04 (strcat "t до " str-04 "°С")
		
		str-05 (nth (atoi (get_tile "txt-05")) list-05)
		str-06 (nth (atoi (get_tile "txt-06")) list-06)
		str-07 (nth (atoi (get_tile "txt-07")) list-07)
		str-08 (nth (atoi (get_tile "txt-08")) list-08)
		cntr-1 0
		str-02 ""
);setq

(repeat (length list-02)
	(setq str-02-tmp (nth cntr-1 list-02)
			cntr-1 (1+ cntr-1)				
			str-02 (strcat str-02 str-02-tmp)
	);setq
);repeat

(setq list-901 (vl-list* (strcat str-01 "   " str-03 "   " str-04 "   " str-08) list-901)
		
		tmp-list-902 (list (cons 0 "Закладная конструкция для измерения давления") (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08))
		
		list-902 (vl-list*  tmp-list-902 list-902)

		list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-08-mrtg-dsgn-pressure

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-101-08 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-01 (cdr (assoc 1 str-tmp))
			str-00 (cdr (assoc 0 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-02 (strcase (vl-string-right-trim " " str-02) 1)
			str-03 (cdr (assoc 3 str-tmp))
			str-04 (cdr (assoc 4 str-tmp))
			str-05 (cdr (assoc 5 str-tmp))
			str-06 (cdr (assoc 6 str-tmp))
			str-07 (cdr (assoc 7 str-tmp))
			str-08 (cdr (assoc 8 str-tmp))
			str-07 (vl-string-subst "штуцер" "Штуцер" str-07)
			str-07 (vl-string-subst "отвод" "Отвод" str-07)
			str-07 (vl-string-subst "труба" "Труба" str-07)
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ЗК14-2-27-2009")
		(setq str-08 (strcase str-08 1));setq
	);if =
  
 	(setq str-701 (strcat str-00 " " str-05 " " str-01  " (" str-02 ", " str-03 ", " str-04 "), в составе: клапан " str-06 ", " str-07 ", к прибору " str-08)
			str-702 nil
	);setq
 
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**2**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-mrtg-dsgn-pressure

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-00 (cdr (assoc 0 str-tmp))
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-02 (vl-string-right-trim " " str-02)
			str-03 (cdr (assoc 3 str-tmp))
			str-04 (cdr (assoc 4 str-tmp))
			str-05 (cdr (assoc 5 str-tmp))
			str-06 (cdr (assoc 6 str-tmp))
			str-07 (cdr (assoc 7 str-tmp))
			str-08 (cdr (assoc 8 str-tmp))
			str-07 (vl-string-subst "штуцер" "Штуцер" str-07)
			str-07 (vl-string-subst "отвод" "Отвод" str-07)
			str-07 (vl-string-subst "труба" "Труба" str-07)
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "ЗК14-2-1-2009")
			  (= str-01 "ЗК14-2-7-2009")
			  (= str-01 "ЗК14-2-12-2009")
			  (= str-01 "ЗК14-2-17-2009")
			  (= str-01 "ЗК14-2-18-2009")
			  (= str-01 "ЗК14-2-25-2009"))
			  
		(setq str-99 "0,8");setq
	);if


	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ЗК14-2-27-2009")
		(setq str-08 (strcase str-08 1)
				str-99 "1,2"
		);setq
	);if
	
	(setq str-701 str-00				
			str-702 (list (cons 1 (strcase str-02 1))
							  (cons 2 (strcat str-03 ", " str-04))
							  (cons 3 (strcat "присоединение " str-08))
							  (cons 4 (strcat "в составе: клапан " str-06 ", " str-07)))				
				
			str-order (list (cons 1 (strcat str-05 " " str-01))
								 (cons 2 " ")
								 (cons 3 nil));list
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)	

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-08-mrtg-dsgn-pressure

(list-902 / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-09 (cdr (assoc 9 str-tmp))
				str-10 (cdr (assoc 10 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ЗК14-2-17-2009")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-99 (cdr (assoc 99 str-tmp))
			);setq
					
			(setq nmbr-ln 10);setq
					
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
					
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Закладная конструкция для отборного")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "устройства давления на t свыше 70°С")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "со штуцерно-муфтовым клапаном для")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "установки рабочего манометра и")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "сброса давления (установка на")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "вертикальном трубопроводе или")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "стенке аппарата) в составе:")

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- клапан " str-06))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- " str-07))
		);progn
	);if
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)

		

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





