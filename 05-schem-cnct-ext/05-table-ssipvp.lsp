;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// название программы****************                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:05-table-ssipvp

( / adoc counter counter-1 counter-2 data-cable-cover data-cable-ln data-cable-mrk data-chain-type data-dsgn-cable data-frm data-whr dcl-id dwg-file-dir file-to-write list-901 
list-902 name-file-dwg name-file-spcf set-obj set-obj-data str-txt str-up str-up-01 str-up-02 str-up-03 str-up-04 str-up-05 str-up-06 str-up-07 tmp-list-901 typ-obj)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))))

(setvar	"cmdecho" 0)

(setq counter 1
      list-901 nil
      list-902 nil
);setq

(while (/= (setq set-obj (entsel "\nОткуда\n")) nil) ;цикл выбор примитивов

	(05-table-ssipvp-txt-frm-txt set-obj)
	
	(setq data-frm set-obj-data
				set-obj nil
				set-obj-data nil
	);setq

	;;;;;;;/////////////////////////////////////////////////////////////
	(setq set-obj (entsel "\nОбозначение кабеля\n"))

	(cond
		((/= set-obj nil) 
			(05-table-ssipvp-txt-frm-txt set-obj)
			(setq data-dsgn-cable set-obj-data
						set-obj-data nil
			);setq
		);=

		((= set-obj nil) 
			(setq data-dsgn-cable "Б/н"
						set-obj-data nil
			);setq
		);=
	);cond

	;;;;;;;/////////////////////////////////////////////////////////////
	(setq set-obj (entsel "\nМарка кабеля\n")
				set-obj (entget (car set-obj))
				typ-obj (cdr (assoc 0 set-obj))
	);setq

	(cond
		((= typ-obj "INSERT") 
			(05-table-ssipvp-txt-frm-blck set-obj)
			(setq data-cable-mrk set-obj-data
						set-obj-data nil
			);setq
		);=
		
		((wcmatch typ-obj "*TEXT") 
			(setq data-cable-mrk (cdr (assoc 1 set-obj))
						set-obj-data nil
			);setq
		);=
	);cond

	;;;;;;;/////////////////////////////////////////////////////////////
	(setq set-obj (entsel "\nДлина кабеля\n"))

	(05-table-ssipvp-txt-frm-txt set-obj)

	(setq data-cable-ln set-obj-data
				set-obj-data nil
	);setq

	;;;;;;;/////////////////////////////////////////////////////////////
	(setq set-obj (entsel "\nКуда\n"))

	(05-table-ssipvp-txt-frm-txt set-obj)

	(setq data-whr set-obj-data
				set-obj-data nil
	);setq

	;;;;;;;/////////////////////////////////////////////////////////////
	(setq set-obj (entsel "\nТруба защитная\n"))

	(05-table-ssipvp-txt-frm-txt set-obj)

	(setq data-cable-cover set-obj-data
				set-obj-data nil
	);setq


	(if (< (setq dcl-id (load_dialog "dia-05-table-ssipvp.dcl")) 0) ;ищем диалог
			(progn
				(alert "Не найден dcl-файл")
				(exit)
			);progn
	);if

	(if (not (new_dialog "dia_05_table_ssipvp" dcl-id))
			(exit)
	);if

	(action_tile "but-1"
		(strcat "(setq data-chain-type \"+\")"
						"(done_dialog)"
		);strcat
	);action_tile

	(action_tile "but-2"
		(strcat "(setq data-chain-type nil)"
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

	(if (/= list-901 nil) (setq list-901 (reverse list-901)));if

	(setq tmp-list-901 (list (cons 1 data-dsgn-cable) (cons 2 data-frm) (cons 3 data-whr) (cons 4 data-cable-mrk) (cons 5 data-cable-ln) (cons 6 data-cable-cover) (cons 7 data-chain-type))
				list-901 (vl-list* tmp-list-901 list-901)
				counter (+ counter 1)
	);setq
	
	(setq list-901 (reverse list-901));setq

);while

;;;;;;;вывод в файл ////////////////////////////////////////////////////////////////////////////////
(setq name-file-dwg (vl-string-right-trim ".dwg" (getvar "dwgname"))
			dwg-file-dir (getvar "dwgprefix")
			name-file-spcf (strcat name-file-dwg " ssivp")
);setq

(setq file-to-write (open (strcat dwg-file-dir name-file-spcf ".txt") "w"));setq
	
(write-line (strcat "№ п/п;;Направление;;;;Длина;;Труба;") file-to-write)
(write-line (strcat ";Номер кабеля, жгута, трубы;Откуда;Куда;Направление по чертежам расположения;"
										"Марка, число жил, сечение;Проектируемая;Фактическая;Марка, диаметр;Длина, м;"
										"Измерительная цепь;Чертеж установки;Примечание") file-to-write)

(setq counter-1 0
			counter-2 1
);setq

(repeat (length list-901)
	(setq str-up (nth counter-1 list-901)
				str-up-01 (cdr (assoc 1 str-up))
				str-up-02 (cdr (assoc 2 str-up))
				str-up-03 (cdr (assoc 3 str-up))
				str-up-04 (cdr (assoc 4 str-up))
				str-up-05 (cdr (assoc 5 str-up))
				str-up-06 (cdr (assoc 6 str-up))
				str-up-07 (cdr (assoc 7 str-up))
	);setq

	(cond
		((= str-up-02 nil) (setq str-up-02 ";"));=
		((/= str-up-02 nil) (setq str-up-02 (strcat str-up-02 ";")));=
	);cond

	(cond
		((= str-up-03 nil) (setq str-up-03 ";"));=
		((/= str-up-03 nil) (setq str-up-03 (strcat str-up-03 ";")));=
	);cond
		
	(cond
		((= str-up-05 nil) (setq str-up-05 ";"));=
		((/= str-up-05 nil) (setq str-up-05 (strcat str-up-05 ";")));=
	);cond
	
	(cond
		((= str-up-06 nil) (setq str-up-06 ";"));=
		((/= str-up-06 nil) (setq str-up-06 (strcat str-up-06 ";")));=
	);cond
	
	(cond
		((= str-up-07 nil) (setq str-up-07 ";"));=
		((/= str-up-07 nil) (setq str-up-07 (strcat str-up-07 ";")));=
	);cond
	
	(setq str-txt (strcat (itoa counter-2) ";" str-up-01 ";" str-up-02 str-up-03 ";" str-up-04 ";" str-up-05 ";" str-up-06 ";" ";" str-up-07));setq
	
	(write-line str-txt file-to-write)
	
	(setq counter-1 (1+ counter-1)
				counter-2 (1+ counter-2)
	);setq
);repeat

(close file-to-write)











(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 05-table-ssipvp-txt-frm-txt

(set-obj)

(if (/= set-obj nil)
	(setq set-obj (entget (car set-obj))
				set-obj-data (cdr (assoc 1 set-obj))
	);setq
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 05-table-ssipvp-txt-frm-blck

(set-obj / block-name select-obj)

(setq block-name (cdr (assoc 2 set-obj)));setq

(command "_.-bedit" block-name)

(setq	select-obj (ssget "_c" '(-1 0) '(-2 -15) '((0 . "*TEXT"))));setq
		
(command "._bclose") ;"_s"

(setq select-obj (entget (ssname select-obj 0))
			set-obj-data (cdr (assoc 1 select-obj))
);setq

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////