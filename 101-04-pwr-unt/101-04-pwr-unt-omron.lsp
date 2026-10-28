;\\\\\\\ ************************************************************ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;\\\\\\\                                                              \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;\\\\\\\ ************************************************************ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
(defun 101-04-pwr-unt-omron

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-1001 list-801 list-802 list-901 list-902 list-txt str-01 str-02 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq	list-901 nil
      list-902 nil
      list-txt nil
      
			str-01 nil
			str-02 nil
);setq

(read-file-for-dialog-box "101-04-pwr-unt-omron-s8vk-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-04-pwr-unt-omron)

(if (< (setq dcl-id (load_dialog "dia-101-04-pwr-unt-omron.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_pwr_unt_omron" dcl-id))
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
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
	(strcat "(start-101-04-pwr-unt-omron)");strcat
);action_tile

(action_tile "txt-02" 
	(strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-03" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-04" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-05" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-06" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-07" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-08" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat	"(filling-fields-101-04-pwr-unt-omron)"
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
	((= type-list "le") (le-101-04-pwr-unt-omron));=
	((= type-list "spcf") (spcf-101-04-pwr-unt-omron));=
	((= type-list "lecgv") (lecgv-101-04-pwr-unt-omron));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;\\\\\\\ конец программы \\\\\\\

;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
(defun start-101-04-pwr-unt-omron

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

(cond
	((= str-01 "S8VK-G")
		(set_tile "ptxt-041" "Uвыход,")
		(set_tile "ptxt-042" "В")
		(set_tile "ptxt-051" "Iнагр,")
		(set_tile "ptxt-052" "А")
		(set_tile "ptxt-071" "Развязка")
		(set_tile "ptxt-072" "каналов")
	);=

	((= str-01 "S8VK-R")
		(set_tile "ptxt-041" "Iвход,")
		(set_tile "ptxt-042" "A")
		(set_tile "ptxt-051" "Iвыход,")
		(set_tile "ptxt-052" "А")
		(set_tile "ptxt-071" "")
		(set_tile "ptxt-072" "")
	);=
);cond

(read-file-for-dialog-box name-file-1 num-flds)

(divide-text-into-parts-02-list-text list-1001-read-file 50)

(if (= str-01 "S8VK-R")
		(setq list-07-read-file list-06-read-file
					list-06-read-file nil
		);setq
);if

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-08 list-07-read-file
			list-1001 list-1001-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-04-pwr-unt-omron

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-08 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
      cntr-1 0
);setq

(if (/= list-901 nil) (setq list-902 (reverse list-902)));if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "S8VK-G")
	(setq list-901 (vl-list* (strcat str-02 "  Uвход " str-03 "В  Uвыход " str-04  "В  Iнагр " str-05 "А") list-901)
  	
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-08))
					
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "S8VK-R")	
	(setq list-901 (vl-list* (strcat str-02 "  Uвход " str-03 "В  Iвход " str-04 "А  Iвыход " str-05 "А") list-901)
  	
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-08))
	);setq
);if
  
(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-pwr-unt-omron

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-tmp str-txt str-txt-01)

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
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "S8VK-G")
		(setq str-txt (strcat "Блок питания, Omron " str-02 ", Uвход " str-03 "В, Uвыход " str-04 "В, Iнагр. " str-05 "А")
					str-txt-01 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "S8VK-R")
		(setq str-txt (strcat "Модуль резервирования блоков питания, Omron " str-02 "," "Uвход " str-03 "В, Iвход " str-04 "А, Iвыход " str-05 "А")
					str-txt-01 nil
		);setq
	);if

	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
 
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-pwr-unt-omron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

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

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "S8VK-G")
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок питания")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uвход " str-03 "В, Uвыход " str-04 "В, Iнагр " str-05 "А"))		
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "S8VK-R")
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль резервирования блоков питания")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uвход " str-03 "В, Iвход " str-04 "А, Iвыход " str-05 "А"))
		);progn
	);if


	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02))
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Omron Electronics LLC")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-pwr-unt-omron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-tmp x-pnt-ins y-pnt-ins)

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

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "S8VK-G" str-01)
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Блок питания Omron, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Uвход " str-03 "В, Uвыход " str-04 "В,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "Iнагр " str-04 "А"))			
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "S8VK-R" str-01)
		(progn
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль резервирования блоков")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "питания Omron, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "Uвход " str-03 "В, Iвход " str-04 "В,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "Iвыход " str-05 "А"))			
		);progn
	);if
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	
		