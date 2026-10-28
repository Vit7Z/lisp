;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-cir-brk-schn-acti-9-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-1001 list-801 list-802 list-900-dscr list-900-menu list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-cir-brk-schn-acti-9-01-general.txt" 4)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			list-99 list-04-read-file
			
      list-901 nil
      list-902 nil
      
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-04-cir-brk-schn-acti-9-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-cir-brk-schn-acti-9-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_cir_brk_acti_9" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(set_tile \"txt-99\" str-01)"
  				"(txt-01-101-04-cir-brk-schn-acti-9-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-02)"
  				"(set_tile \"txt-04\" str-02)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-cir-brk-schn-acti-9-01-general)");strcat
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
	((= type-list "le") (le-101-04-cir-brk-schn-acti-9-01-general));=
	((= type-list "spcf") (spcf-101-04-cir-brk-schn-acti-9-01-general));=
	((= type-list "lecgv") (lecgv-101-04-cir-brk-schn-acti-9-01-general));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-cir-brk-schn-acti-9-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-900-dscr list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-900 list-900-dscr
);setq

(divide-text-into-parts list-900-dscr 60)

(setq list-900 list-900-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" str-01)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////
(defun but1-101-04-cir-brk-schn-acti-9-01-general

( / str-01 str-01-01 str-01-02 str-02 str-03 str-04 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(cond 
	((vl-string-search "хар-ка С" str-01) (setq str-01-01 "хар-ка С"));=
	((vl-string-search "хар-ка D" str-01) (setq str-01-01 "хар-ка D"));=
);cond

(cond 
	((vl-string-search "1 пол." str-01) (setq str-01-02 "1 полюс"));=
	((vl-string-search "2 пол." str-01) (setq str-01-02 "2 полюса"));=
	((vl-string-search "3 пол." str-01) (setq str-01-02 "3 полюса"));=
);cond

(setq str-01 (substr str-01 1 (vl-string-search "," str-01)));setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

(setq list-901 (vl-list* (strcat str-03 "  Iном. " str-02  "А  " str-01-01 "  " str-01-02) list-901)

			tmp-list-902 (list (cons 1 str-01) (cons 2 str-03) (cons 3 str-02) (cons 4 str-01-01) (cons 5 str-01-02) (cons 99 str-99))
);setq

(setq list-902 (vl-list*  tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////
(defun le-101-04-cir-brk-schn-acti-9-01-general

( / cntr-1 pnt-ins str-1 str-2 str-3 str-4 str-5 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (or (= str-1 "iC60N")
					(= str-1 "iC120N"))
					
		(setq str-701 (strcat "Выключатель автоматический Schneider Electric " str-2 ", Iном. " str-3 "А, " str-4 ", " str-5)
					str-702 nil
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-1 "S 200M UC")
		(setq str-701 (strcat "Выключатель автоматический Schneider Electric " str-2 " (пост./перем. ток), Iном. " str-3 "А, " str-4 ", " str-5)
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////
(defun spcf-101-04-cir-brk-schn-acti-9-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-01-01 str-01-02 str-02 str-03 str-04 str-99 str-tmp str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
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
	
	(cond
		((/= "C60-DC" (substr str-01 1 6))
			(setq str-01-01 (substr str-01 1 (vl-string-search "," str-01))
						str-01-02 (substr str-01 (+ (vl-string-search "," str-01) 3))
			);setq
		);=
		
		((= "C60-DC" (substr str-01 1 6))
			(setq str-01-01 (substr str-01 1 (vl-string-search " " str-01))
						str-01-02 (strcat (substr str-01 (+ (vl-string-search "," str-01) 3)) ", для пост. тока")
			);setq
		);=
	);cond

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 3
				str-txt (strcat str-01-01 " " str-03 "А, артикул " str-04)
	);setq
	
	(1000-delete-items-spcf nmbr-ln pnt-ins)
	(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Выключатель автоматический")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-02 ", Iном. " str-03 "А, " str-01-02))






			
	(split-str-parts-spcf-60-01 str-txt nil "," pnt-ins)
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Schneider Electric")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
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
(defun lecgv-101-04-cir-brk-schn-acti-9-01-general

( / cntr-1 pnt-ins str-01 str-01-1 str-01-2 str-02 str-03 str-04 str-99 str-tmp str-txt)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-01-1 (substr str-01 1 (vl-string-search "," str-01))
				str-01-2 (substr str-01 (+ (vl-string-search "," str-01) 3))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-txt (strcat "Выключатель автоматический, " str-01-1 ", " str-02 ", Iном. " str-03 "А, " str-01-2 ", артикул " str-04));setq
			
	(split-str-parts-lecgv-065-01 str-txt nil nil str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

