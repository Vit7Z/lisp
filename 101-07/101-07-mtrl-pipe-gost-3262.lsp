;/////// ************************************************************ //////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 101-07-mtrl-pipe-gost-3262

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-900 list-900-dscr list-900-read-file list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-07-mtrl-pipe-gost-3262.txt" 4)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-900 list-900-dscr
			
      list-901 nil
      list-902 nil
);setq

(divide-text-into-parts list-900-dscr 50)

(setq list-900 list-900-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-101-07-mtrl-pipe-gost-3262.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_07_mtrl_pipe_gost_3262" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(set_tile \"txt-02\" str-01)"
  				"(set_tile \"txt-03\" str-01)"
  				"(set_tile \"txt-04\" str-01)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-07-mtrl-pipe-gost-3262)");strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
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
	((= type-list "spcf") (spcf-101-07-mtrl-pipe-gost-3262 list-902));=
	((= type-list "lecgv") (lecgv-101-07-mtrl-pipe-gost-3262 list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-07-mtrl-pipe-gost-3262

( / str-01 str-02 str-99 tmp-list-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-99 (nth (atoi (get_tile "txt-03")) list-03)	
);setq

(setq list-901 (vl-list* (strcat "Ду " str-01) list-901)
			
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-99))
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////
(defun spcf-101-07-mtrl-pipe-gost-3262

(list-902 / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 "Труба стальная водогазопроводная"
			
				str-702 (list (cons 1 (strcat "наружн. диаметр " str-02 "мм")));list
											 
				str-order (list (cons 1 (strcat "Труба " str-01 " ГОСТ 3262-75")) 
												(cons 2 nil) 
												(cons 3 nil));list
					
				str-unit "м"
				str-manufact nil
				str-note nil					
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-07-mtrl-pipe-gost-3262

(list-902 / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Труба стальная водогазопроводная " str-01)
			
				str-702 " ГОСТ 3262-75"
											 
				str-703 "Кол. в метрах"			
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
		
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

