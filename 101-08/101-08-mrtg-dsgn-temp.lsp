;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mrtg-dsgn-temp

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-base list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-07 list-08 
list-1001 list-801 list-802 list-901 list-902 str-01 str-02 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-08-mrtg-dsgn-temp-01-general.txt" 4)

(setq list-01 list-01-read-file
		  list-801 list-02-read-file
		  list-802 list-03-read-file
		  list-02-base list-04-read-file
			
		  list-901 nil	
		  list-902 nil								
		  str-01 nil
		  str-02 nil
);setq

(txt-01-101-08-mrtg-dsgn-temp)

(if (< (setq dcl-id (load_dialog "dia-101-08-mrtg-dsgn-temp.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_mrtg_dsgn_temp" dcl-id))
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
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-08-mrtg-dsgn-temp)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-08-mrtg-dsgn-temp)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-mrtg-dsgn-temp)");strcat
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

(if (= type-list "le") (tmp-le-101-08-mrtg-dsgn-temp list-902));if
(if (= type-list "spcf") (tmp-spcf-101-08-mrtg-dsgn-temp list-902));if
(if (= type-list "lecgv") (tmp-lecgv-101-08-mrtg-dsgn-temp list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;подпрогамма чтения данных из файлов//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-mrtg-dsgn-temp

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-1001-read-file name-file-1 num-flds)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
			str-02 (nth 0 list-02-base)
			name-file-1 (nth 0 list-801)
			num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-01")) list-02-base)
			name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
			num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

;диалог заголовки полей
(cond
	((or (= str-01 "ЗК4-1-1-95")
		  (= str-01 "ЗК4-1-6-95")
		  (= str-01 "ЗК4-1-8-95"));
		(set_tile "l-04-1" "Т среды,")
		(set_tile "l-04-2" "С")
		(set_tile "l-06-1" "Материал")
		(set_tile "l-06-2" "")			
		(set_tile "l-08-1" "Тип присоединения")
		(set_tile "l-08-2" "")
	);=
	
	((or (= str-01 "ЗК4-1-10-95"));
		(set_tile "l-04-1" "Длина")
		(set_tile "l-04-2" "бобышки")
		(set_tile "l-06-1" "Диаметр термо-")
		(set_tile "l-06-2" "преобразователя")
		(set_tile "l-08-1" "№ рисунка")
		(set_tile "l-08-2" "")
	);=
);cond

(divide-text-into-parts-02-list-text (list str-02) 50)

(setq list-02 list-1001-read-file);setq

(read-file-for-dialog-box name-file-1 num-flds)

(divide-text-into-parts-02-list-text list-1001-read-file 230)

(setq list-03 list-01-read-file
		list-04 list-02-read-file
		list-05 list-03-read-file
		list-06 list-04-read-file
		list-07 list-05-read-file
		list-08 list-06-read-file
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

;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;подпрогамма чтения данных из файлов//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-08-mrtg-dsgn-temp

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
(defun tmp-filling-fields-101-08-mrtg-dsgn-temp

( / cntr-1 str-01 str-02 str-02-tmp str-03 str-04 str-05 str-06 str-07 str-08 swtch tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
		str-02 ""
		str-03 (nth (atoi (get_tile "txt-03")) list-03)
		str-04 (nth (atoi (get_tile "txt-04")) list-04)
		str-05 (nth (atoi (get_tile "txt-05")) list-05)
		str-06 (nth (atoi (get_tile "txt-06")) list-06)
		str-07 (nth (atoi (get_tile "txt-07")) list-07)
		str-08 (nth (atoi (get_tile "txt-08")) list-08)
		cntr-1 0
);setq

(repeat (length list-02)
	(setq str-02-tmp (nth cntr-1 list-02)
			cntr-1 (1+ cntr-1)				
			str-02 (strcat str-02 str-02-tmp)
	);setq
);repeat

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ЗК4-1-1-95")
	(setq list-901 (vl-list* (strcat str-01 "  Бобышка  " str-03 "МПа " str-05 " " str-06) list-901));setq
);if =

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ЗК4-1-6-95")
	(setq list-901 (vl-list* (strcat str-01 "  Расширитель прямой  " str-03 "МПа " str-05 " " str-06) list-901));setq
);if =

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ЗК4-1-8-95")
	(setq list-901 (vl-list* (strcat str-01 "  Расширитель угловой  " str-03 "МПа " str-05 " " str-06) list-901));setq
);if =

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ЗК4-1-10-95")
	(setq list-901 (vl-list* (strcat str-01 "  Фланец с бобышкой. Установка на воздуховоде  " str-05 " Длина бобышки " str-04 "мм") list-901));setq
);if =

(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08))
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
(defun tmp-le-101-08-mrtg-dsgn-temp

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-061 str-062 str-07 str-08 str-701 str-702 str-tmp str-tmp-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-02 (vl-string-right-trim " " str-02)
			str-02 (vl-string-right-trim ")" str-02)
			str-03 (cdr (assoc 3 str-tmp))
			str-04 (cdr (assoc 4 str-tmp))
			str-05 (cdr (assoc 5 str-tmp))
			str-06 (cdr (assoc 6 str-tmp))
			str-07 (cdr (assoc 7 str-tmp))
			str-08 (cdr (assoc 8 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(cond
		((= str-06 "Сталь 20") (setq str-06 "сталь 20" str-061 "0" str-062 "20"));=
	);cond

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "ЗК4-1-1-95")
					(= str-01 "ЗК4-1-6-95")
					(= str-01 "ЗК4-1-8-95")
					)
		(setq str-701 (strcat str-02 ", " str-06 ", присоединение " str-05 "). Установка " str-061 str-08 "-" str-07 "-" str-062 "-" str-03 " " str-01)			
					str-702 nil
		);setq
	);if
	


 ;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ЗК4-1-10-95")
		(setq str-701 (strcat str-02 ", присоединение " str-05 "). Установка " str-07 "-" str-04 "-" str-06 "-" str-08 " " str-01)
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
(defun tmp-spcf-101-08-mrtg-dsgn-temp

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-061 str-062 str-07 str-08 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

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
	);setq
	
	(cond
		((= str-06 "Сталь 20") (setq str-06 "сталь 20" str-061 "0" str-062 "20"));=
	);cond
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ЗК4-1-1-95")
		(setq str-701 str-02
	
				str-702 (list (cons 1 (strcat "присоединение " str-05))
								  (cons 2 (strcat "материал " str-06))
								  (cons 3 (strcat "давление до " str-03 "МПа")))
											
				str-manufact "ОВЕН, г. Москва"
				
				str-order (list (cons 1 (strcat "Установка " str-061 str-08 "-" str-07 "-" str-062 "-" str-03 " " str-01))
									 (cons 2 "-") 
									 (cons 3 nil));list
				
				str-unit "компл."
				str-crtf nil
				str-99 "0,4"
		);setq
	);if =
	
;	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;	(if (or (= str-tmp-1 "ЗК4-1-6-95")
;					(= str-tmp-1 "ЗК4-1-8-95"))
;		(setq str-txt str-tmp-2					
;					str-txt-01 (strcat "- присоединение " str-tmp-5 ", материал " str-tmp-6 ", давление до " str-tmp-3 "МПа")
;					str-txt-02 (strcat "Установка " str-tmp-61 str-tmp-8 "-" str-tmp-7 "-" str-tmp-62 "-" str-tmp-3 " " str-tmp-1)						
;					str-not nil
;					str-99 "1,4"
;		);setq
;	);if =
;
;
;	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;	(if (= str-tmp-1 "ЗК4-1-10-95")
;		(progn	
;			(cond
;				((= str-tmp-5 "М20х1,5") (setq str-99 "0,6"));=
;			);cond
;			
;			(setq str-txt str-tmp-2					
;						str-txt-01 (strcat "- присоединение " str-tmp-5 ", давление до " str-tmp-3 "МПа")
;						str-txt-02 (strcat "Установка " str-tmp-7 "-" str-tmp-4 "-" str-tmp-6 "-" str-tmp-8 " " str-tmp-1)					
;						str-not nil
;			);setq
;		);progn	
;	);if =

;(princ "\n        str-701  = ") (princ str-701 );Erase_DV
;(princ "\n        str-702  = ") (princ str-702 );Erase_DV
;(princ "\n      str-order  = ") (princ str-order );Erase_DV
;(princ "\n   str-manufact  = ") (princ str-manufact );Erase_DV
;(princ "\n       str-unit  = ") (princ str-unit );Erase_DV
;(princ "\n         str-99  = ") (princ str-99 );Erase_DV
;(princ "\n       str-crtf  = ") (princ str-crtf );Erase_DV
;(princ "\n         pnt-ins = ") (princ pnt-ins);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-08-mrtg-dsgn-temp

(list-902 / cntr-1 pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-61 str-tmp-62 str-tmp-7 str-tmp-8 str-txt str-txt-01 str-txt-02 str-txt-99)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-2 (vl-string-right-trim " " str-tmp-2)
				str-tmp-2 (vl-string-right-trim ")" str-tmp-2)
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
	);setq

	(cond
		((= str-tmp-6 "Сталь 20") (setq str-tmp-6 "сталь 20" str-tmp-61 "0" str-tmp-62 "20"));=
	);cond

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-tmp-1 "ЗК4-1-1-95")
					(= str-tmp-1 "ЗК4-1-6-95")
					(= str-tmp-1 "ЗК4-1-8-95"))
		(setq str-txt (strcat str-tmp-2 ", присоединение " str-tmp-5 ", материал " str-tmp-6 ", давление до " str-tmp-3 "МПа)")													
					str-txt-01 (strcat "Установка " str-tmp-61 str-tmp-8 "-" str-tmp-7 "-" str-tmp-62 "-" str-tmp-3 str-tmp-1)
					str-txt-02 nil
					str-txt-99 "0,4"
		);setq
	);if



	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "ЗК4-1-10-95")
		(progn
			(cond
				((= str-tmp-5 "М20х1,5") (setq str-txt-99 "0,6"));=
			);cond
			
			(setq str-txt (strcat str-tmp-2 ", присоединение " str-tmp-5 ", давление до " str-tmp-3 "МПа)")													
						str-txt-01 (strcat "Установка " str-tmp-7 "-" str-tmp-4 "-" str-tmp-6 "-" str-tmp-8 " " str-tmp-1)
						str-txt-02 nil
			);setq
		);progn
	);if

		
	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-txt-99 pnt-ins)

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





