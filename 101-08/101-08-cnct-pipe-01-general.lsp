;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ниппельные соединения                           							//////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-08-cnct-pipe-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 
list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-cnct-pipe-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-08-cnct-pipe-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-cnct-pipe-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_connecting_pipe_general" dcl-id))
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
  				"(txt-01-101-08-cnct-pipe-01-general str-01)"
  );srcat
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
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
          "(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
          "(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-08-cnct-pipe-01-general)");strcat
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

(action_tile "but5"
  (strcat "(setq str-901 (get_tile \"txt-901\"))"
  				"(item-delete-from-lists-901-902 str-901 list-901 list-902)"
  				"(setq list-901 list-901-new)"
  				"(setq list-902 list-902-new)"
  );strcat
);action_tile

;(action_tile "but6"
;  (strcat "(setq type-list \"spcf\")"
;
;  );strcat
;);action_tile

;(action_tile "but7"
;  (strcat "(setq type-list \"spcf\")"
;
;  );strcat
;);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-08-cnct-pipe-01-general list-902));if
(if (= type-list "spcf") (spcf-101-08-cnct-pipe-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-cnct-pipe-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file 
list-06-read-file list-07-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(setq list-02 list-01-read-file
      list-03 list-02-read-file
      list-04 list-03-read-file
      list-05 list-04-read-file
      list-06 list-05-read-file
      list-07 list-06-read-file
      list-08 list-07-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-08-cnct-pipe-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 tmp-902)
  
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
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Вход " str-03 "  Выход " str-04) list-901)
);setq

(cond
	((= str-03 "Свар. диам. 14мм.") (setq str-03 "под сварку (по нар. диаметру 14 мм)"));=
);cond

(cond		
  ((= str-04 "Свар. диам. 10мм.") (setq str-04 "под сварку по нар. диаметру 10 мм"));=
  ((= str-04 "Свар. диам. 14мм.") (setq str-04 "под сварку по нар. диаметру 14 мм"));=
);cond
	
;(cond
;	((= str-05 "Углерод. сталь") (setq str-05 "углеродистая сталь")); =
;	((= str-05 "Нерж. сталь") (setq str-05 "нержавеющая сталь")); =
;);cond


(setq str-03 (strcat "вход " str-03)
			str-04 (strcat "выход " str-04)
			str-05 (vl-string-subst "сталь" "Сталь" str-05)			
			str-06 (strcat "Рраб. до " str-06 "кгс/см2")		
			str-07 (strcat "Tраб. " str-07 "%%dС")

			tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08));список для спецификации
  		
  		list-902 (vl-list* tmp-902 list-902)	
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;вывод в ПЭ                   //////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-cnct-pipe-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp)

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
	);setq

	(setvar "osmode" 6199)
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	      str-701 (strcat str-01 " " str-02 ", " str-03 ", " str-04 ", " str-05 ", " str-06 ", " str-07)
				str-702 nil
	);setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;вывод в спцф                   ////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-cnct-pipe-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-99 
str-manufact str-note str-order str-tmp str-unit)

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
				str-99 "0,2"
	);setq
		
	(setvar "osmode" 6199)
	
	(if (= str-01 "Соединение тройниковое") 
	  (setq str-05 (strcat "резьба гаек М20х1,5, " str-05))
	);if
	
	;обработка данных
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
				str-702 (list (cons 1 str-03)
											(cons 2 str-04)
											(cons 3 str-05)
											(cons 4 str-06)
											(cons 5 str-07)
								);list
											
				str-order (list (cons 1 str-02) 
												(cons 2 " ") 
												(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
									);list
				
				str-unit "шт."
				str-note nil
	);setq

	(if (= "РЦК" str-08) (setq str-manufact "ООО \"РЦК\", г. Ростов-на-Дону"));if

	(if (= "РОЗМА" str-08) (setq str-manufact "ОАО РОЗМА, г. Ростов-на-Дону"));if
	
	(if (= "ПромАвт, Екб" str-08) (setq str-manufact "ООО \"Завод Промавтоматика\", г. Екатеринубрг"));if
	
	(split-str-parts-spcf-01-general str-01 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
