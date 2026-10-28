;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-exec-mech-ps-auto-psq-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 list-801 list-900 list-91 list-92 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-exec-mech-ps-auto-psq-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
      list-901 nil
      list-902 nil      
      str-01 "0"
);setq

(tmp-01-101-01-exec-mech-ps-auto-psq-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-exec-mech-ps-auto-psq-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_exec_mech_ps_auto" dcl-id))
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
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(tmp-01-101-01-exec-mech-ps-auto-psq-01-general)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-exec-mech-ps-auto-psq-01-general)"
  );strcat
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

(cond
	((= type-list "le") (le-101-01-exec-mech-ps-auto-psq-01-general));if
	((= type-list "spcf") (spcf-101-01-exec-mech-ps-auto-psq-01-general));if
);cond

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
;;;; txt-01 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-01-101-01-exec-mech-ps-auto-psq-01-general

(str-01 / list-900-dscr list-902-read-file name-file-1)

(setq name-file-1 (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file-1);

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-06 (cdr (nth 4 list-902-read-file))
			list-07 (cdr (nth 5 list-902-read-file))
			list-08 (cdr (nth 6 list-902-read-file))
			list-99 (cdr (nth 7 list-902-read-file))
			
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-exec-mech-ps-auto-psq-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-07-1 str-07-2 str-99 tmp-list-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-99 (nth (atoi (get_tile "txt-08")) list-08)
);setq


;;;;;;;//////////////////////////////////////////////////////////////////////
(if (= str-07 "Да")
	(setq str-07-1 "Местн. ПУ"
				str-07-2 "местный ПУ"
	);setq
			
	(setq str-07-1 "Без местн. ПУ"
				str-07-2 nil
	);setq
);if


;;;;;;;//////////////////////////////////////////////////////////////////////
(if (or (= str-01 "PSQ203"));
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 "Нм  " str-03  "  " str-06 "  " str-07-1) list-901)
			
				tmp-list-902 
					(list 
						(cons 1 str-01)
						(cons 0 "Электрический исполнительный механизм")
						(cons 2 (strcat "Мном. " str-02 "Нм")) 
						(cons 3 (strcat "Uпит. " str-03)) 
						(cons 4 str-04) 
						(cons 5 (strcat "Iмакс. " str-05 "А"))
						(cons 6 (strcat "датчик полож. " str-06))
						(cons 7 str-07-2)
						(cons 99 str-99)
					);list
	);setq
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-exec-mech-ps-auto-psq-01-general

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-05 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "PSQ203"));
		(if (= str-07 nil)
			(setq str-701 (strcat str-00 " " str-01 ", " str-02 ", " str-03 ", " str-05 ", " str-06));setq
			
			(setq str-701 (strcat str-00 " " str-01 ", " str-02 ", " str-03 ", " str-05 ", " str-06 ", " str-07));setq
		);if
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**2**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-el-exec-mech-zeim-meo-40

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-051 str-06 str-061 str-07 str-08 str-09 str-092 str-1 str-10 str-11 str-2 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-11 (cdr (assoc 11 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(cond
		((= str-05 "М - БКВ") (setq str-051 "- блок концевых выключателей"));=
		((= str-05 "Р - БСПР") (setq str-051 "- блок сигнализации положения БСПР (реостатный)"));=
		((= str-05 "И - БСПИ") (setq str-051 "- блок сигнализации положения БСПИ (индуктивный)"));=
		((= str-05 "У - БСПТ") (setq str-051 "- блок сигнализации положения БСПТ (токовый)"));=
	);cond

	(cond
		((= str-06 "К - ~380В, 50Гц") (setq str-061 "~380В, 50Гц"));=
	);cond
		
	(setq str-092 (substr str-09 1 (- (vl-string-search "(" str-09) 1)));setq

	(setq nmbr-ln 8);setq
	
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Электрический исполнительный механизм")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- номинальный крутящий момент на выходном валу " str-02 "Нм"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- номинальное время полного хода выходного вала " str-03 "с"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- номинальное значение полного хода выходного вала " str-04 "об."))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-051)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- электропитание " str-061 ", потребляемя мощность " str-10 "кВт"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-09 " по ГОСТ 15150"))
	;
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-01 " " str-092)) ;Тип, марка, обозначение документа, опросного листа
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ЯЛБИ.42132.035ТУ")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"АБС ЗЭиМ")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Автоматизация\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Чебоксары")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
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