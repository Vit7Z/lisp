;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-sec-dev-safety-barrier-uppo

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-1001 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box "101-01-sec-dev-safety-barrier-uppo-01-general.txt" 3)

(setq list-901 nil
      list-902 nil
			
			str-01 nil

			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-01-sec-dev-safety-barrier-uppo)

(if (< (setq dcl-id (load_dialog "dia-101-01-sec-dev-safety-barrier-uppo.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_sec_dev_uppo" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-1001" list-1001)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-sec-dev-safety-barrier-uppo)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value))"
  				"(set_tile \"txt-06\" $value))"
  				"(set_tile \"txt-07\" $value))"
  				"(set_tile \"txt-99\" $value))"
  );srcat
);action_tile

(action_tile "but1" 
	(strcat "(filling-fields-101-01-sec-dev-safety-barrier-uppo)");strcat
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

(cond
	((= type-list "le") (le-101-01-sec-dev-safety-barrier-uppo));=
	((= type-list "spcf") (spcf-101-01-sec-dev-safety-barrier-uppo));=
	((= type-list "lecgv") (lecgv-101-01-sec-dev-safety-barrier-uppo));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//// конец программы //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-sec-dev-safety-barrier-uppo

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-1001-read-file name-file-1 num-flds)
   
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

(read-file-for-dialog-box name-file-1 7)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-99 list-07-read-file
);setq

(divide-text-into-parts-02-list-text list-1001-read-file 130)

(setq list-1001 list-1001-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-1001" list-1001)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-sec-dev-safety-barrier-uppo

( / str-01 str-02 str-03 str-06 str-902 str-99 swtch)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
      swtch list-901
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 6 str-06) (cons 99 str-99))
  			
  		list-902 (vl-list*  str-902 list-902)
  			
  		list-901 (vl-list* (strcat str-01 "  " str-02 "  Каналов " str-03 "  " str-06) list-901)
);setq

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-sec-dev-safety-barrier-uppo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-06 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-txt (strcat "Модуль барьера дискретных сигналов " str-02 ", дискретные входные сигналы, "
													"кол. каналов " str-03 ", маркировка взрывозащиты " str-06)
					str-txt-01 nil		
		);setq
	);if


	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-sec-dev-safety-barrier-uppo

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-06 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
				str-06 (cdr (assoc 6 str-tmp))
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
	(if (= str-01 "Дискретный ввод")
		(progn
			(setq nmbr-ln 4);setq
				 
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				 
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль барьера дискретных сигналов")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- вход дискретные сигналы, выход дискретные сигналы, кол. каналов " str-03))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- маркировка взрывозащиты " str-06))
		);progn	
	);if
  

	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-02)
			
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса

	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "АО \"УППО\", г. Уфа")

	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-sec-dev-safety-barrier-uppo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-06 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-txt (strcat "Модуль барьера дискретных сигналов " str-02 ", дискретные входные сигналы, кол. каналов " str-03 ", маркировка взрывозащиты " str-06)
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if

	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
