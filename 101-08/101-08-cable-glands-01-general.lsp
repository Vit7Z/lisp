;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
(defun 101-08-cable-glands-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 
list-05-read-file list-06 list-06-read-file list-07 list-07-read-file list-08 list-08-read-file list-900 list-901 list-902 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-08-cable-glands-01-general.txt" 8)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-06 list-06-read-file
			list-07 list-07-read-file
			list-08 list-08-read-file
			
      list-901 nil
      list-902 nil
);setq

(if (< (setq dcl-id (load_dialog "dia-101-08-cable-glands-01-general.dcl")) 0) ;èùåì äèàëîã
	(progn
		(alert "Íå íàéäåí dcl-ôàéë")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_cable_glands_01_general" dcl-id))
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
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"			
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq str-05 (get_tile \"txt-05\"))"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "txt-06"
  (strcat "(setq str-06 (get_tile \"txt-06\"))"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-08\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-cable-glands-01-general)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
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
	((= type-list "le") (le-101-08-cable-glands-01-general list-902));=
	((= type-list "spcf") (spcf-101-08-cable-glands-01-general list-902));=
	((= type-list "lecgv") (lecgv-101-08-cable-glands-01-general list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// ÊÎÍÅÖ ÏĞÎÃĞÀÌÌÛ                                              //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;ïîäïğîãğàììà ôîğìèğîâàíèÿ äàííûõ////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-cable-glands-01-general

( / str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-08 str-99 tmp-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-99 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

(if (= str-08 "ÇİÒÀĞÓÑ")
	(setq str-00 "Êàáåëüíûé ââîä");setq
	(setq str-00 "Ñàëüíèê");setq
);if

(if (/= str-02 "Íåò")
	(setq str-02 (strcat "àğòèêóë " str-02));setq
);if

(setq list-901 (vl-list* (strcat str-01 "  " str-03 "  " str-05 "ìì  " str-06) list-901)

      str-04 (strcat "ğåçüáà " str-04)
      str-05 (strcat "äèàì. êàáåëÿ " str-05 "ìì")
      str-03 (strcase str-03 1)
      str-06 (strcase str-06 1)
      
			tmp-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) 
			(cons 99 str-99) (cons 8 str-08))
);setq

(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;ïîäïğîãğàììà âûâîäà â Ïİ                   /////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-cable-glands-01-general

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-05 str-06 str-08 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-08 (cdr (assoc 8 str-tmp))
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))	
	);setq

	(setvar "osmode" 6199)	
	(setq pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÇİÒÀĞÓÑ")
		(setq str-02 (cdr (assoc 02 str-tmp))					
					str-701 (strcat str-00 " " str-01 ", " str-02 ", " str-03 ", " str-05 ", " str-06)	
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÒÖ İÌÈ")
		(setq str-701 (strcat str-00 " " str-01 ", " str-03 ", " str-05 ", " str-06));setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;ïîäïğîãğàììà âûâîäà â ÷ğî               ////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-08-cable-glands-01-general

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-05 str-06 str-08 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-08 (cdr (assoc 8 str-tmp))
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
	);setq
	
	(setvar "osmode" 6199)	
	(setq pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n"));setq

  ;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÇİÒÀĞÓÑ")
		(setq str-02 (cdr (assoc 02 str-tmp))					
					str-701 (strcat str-00 " " str-01 ", " str-02 ", " str-03 ", " str-05 ", " str-06)	
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÒÖ İÌÈ")
		(setq str-701 (strcat str-00 " " str-01 ", " str-03 ", " str-05 ", " str-06));setq
	);if

	;;;;;;;;;/////////
	(setq str-702 nil
				str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;ïîäïğîãğàììà âûâîäà â ñïöô                   ///////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-cable-glands-01-general

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-05 str-06 str-08 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp 
str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)	
	(setq pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÇİÒÀĞÓÑ")
		(setq str-02 (cdr (assoc 02 str-tmp))
		      str-701 str-00
				
					str-702 (list (cons 1 str-03)
												(cons 2 str-05)
												(cons 3 str-06));list
											 
					str-order (list (cons 1 (strcat str-01 ", " str-02)) 
													(cons 2 ",") 
													(cons 3 nil));list
													
					str-manufact "ÀÎ \"ÇİÒÀ\", ã. Ìîñêâà"						
		);setq
	);if
		
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-08 "ÒÖ İÌÈ")
		(setq str-701 str-00
				
					str-702 (list (cons 1 str-03)
												(cons 2 str-05)
												(cons 3 str-06));list
											 
					str-order (list (cons 1 str-01) 
													(cons 2 ",") 
													(cons 3 nil));list
													
					str-manufact "ÎÎÎ \"ÒÖ İÌÈ\", ã. Ìîñêâà"						
		);setq
	);if

	(setq str-unit "êîìïë."
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins) 
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////