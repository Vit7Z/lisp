;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-exec-mech-pem-a

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
);setq

(start-101-01-exec-mech-pem-a)

(if (< (setq dcl-id (load_dialog "dia-101-01-exec-mech-pem-a.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_exec_mech_pem_a" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")

(action_tile "txt-00"
  (strcat "(set_tile \"txt-01\" $value)"
					"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile

(action_tile "txt-01"
  (strcat "(set_tile \"txt-00\" $value)"
					"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-00\" $value)"
					"(set_tile \"txt-01\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-00\" $value)"
					"(set_tile \"txt-01\" $value)"
					"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-00\" $value)"
					"(set_tile \"txt-01\" $value)"
					"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-00\" $value)"
					"(set_tile \"txt-01\" $value)"
					"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-08\" \"0\")"
					"(set_tile \"txt-09\" $value)"
  				"(txt-00-101-01-exec-mech-pem-a)"
  );srcat
);action_tile


(action_tile "but1"
  (strcat "(but1-101-01-exec-mech-pem-a)");strcat
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
	((= type-list "le") (le-101-01-exec-mech-pem-a));=
	((= type-list "spcf") (spcf-101-01-exec-mech-pem-a));=
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
(defun start-101-01-exec-mech-pem-a

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-08-read-file list-09-read-file)

(setq list-08 (list "М Блок концевых выключателей" 
										"У Токовый датчик сигнализации положения"
										"КИМ1-3-А-380 Аналоговое управление"
										"КИМ1-3-Д-380 Дискретное управление"
										"КИМ1-3-С-380 Сетевое управление"
										"КИМ1-3-Т-380 Дискретно-сетевое управление")
);setq

(read-file-for-dialog-box "101-01-exec-mech-pem-a.txt" 9);setq

(setq list-00 list-01-read-file
			list-01 list-02-read-file
      list-02 list-03-read-file
      list-03 list-04-read-file
      list-04 list-05-read-file
      list-05 list-06-read-file
      list-06 list-07-read-file
      list-07 list-08-read-file
      list-09 list-09-read-file
);setq

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-00 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-00-101-01-exec-mech-pem-a

( / str-00-1)

(setq str-00-1 (nth (atoi (get_tile "txt-00")) list-00));setq

(cond
	((= str-00-1 "А16") (setq list-08 (list "М Блок концевых выключателей")));=
	((= str-00-1 "А17") (setq list-08 (list "Р Реостатный датчик сигнализации положения")));=
	((= str-00-1 "А18") (setq list-08 (list "У Токовый датчик сигнализации положения")));=
	((= str-00-1 "А19") (setq list-08 (list "И Индуктивный датчик сигнализации положения")));=
	((= str-00-1 "А11") (setq list-08 (list "М Блок концевых выключателей" 
											 										"У Токовый датчик сигнализации положения"
											 										"КИМ1-3-А-380 Аналоговое управление"
																					"КИМ1-3-Д-380 Дискретное управление"
																					"КИМ1-3-С-380 Сетевое управление"
																					"КИМ1-3-Т-380 Дискретно-сетевое управление"										 										
											 										)));=
);cond


(list-filling "txt-08" list-08)

(set_tile "txt-08" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-exec-mech-pem-a

( / str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-99 swtch tmp-list-902)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
      swtch list-901
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-99 (nth (atoi (get_tile "txt-09")) list-09)
);setq

(setq list-901 (vl-list* (strcat "ПЭМ-" str-00 "  " 
																 "Момент " str-01 "Нм  " 
																 "Частота вращения " str-02 "об/мин  " 
																 "Мощность " str-04 "кВт  " 
																 "Iном.=" str-05 "А  "
																 "Iпуск.=" str-06 "А  "
																 "Вал " str-07 "  " 
																 str-08) list-901)

			tmp-list-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 99 str-99))
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-exec-mech-pem-a

( / cntr-1 pnt-ins str-0 str-4 str-5 str-8 str-81 str-tmp str-txt)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-8 (cdr (assoc 8 str-tmp))
	);setq
	
	(cond
		((= str-8 "М Блок концевых выключателей") (setq str-8 "М" str-81 "блок концевых выключателей"));=
		((= str-8 "Р Реостатный датчик сигнализации положения") (setq str-8 "Р" str-81 "реостатный датчик сигнализации положения"));=
		((= str-8 "И Индуктивный датчик сигнализации положения") (setq str-8 "И" str-81 "индуктивный датчик сигнализации положения"));=
		((= str-8 "У Токовый датчик сигнализации положения") (setq str-8 "У" str-81 "токовый датчиком сигнализации положения"));=
		
		((= str-8 "КИМ1-3-А-380 Аналоговое управление") (setq str-8 "Е" str-81 "контроллер КИМ1-3-А-380 (аналоговое управление)"));=
		((= str-8 "КИМ1-3-Д-380 Дискретное управление") (setq str-8 "Е" str-81 "контроллер КИМ1-3-Д-380 (дискретое управление)"));=
		((= str-8 "КИМ1-3-С-380 Сетевое управление") (setq str-8 "Е" str-81 "контроллер КИМ1-3-С-380 (сетевое управление)"));=
		((= str-8 "КИМ1-3-Т-380 Дискретно-сетевое управление") (setq str-8 "Е" str-81 "контроллер КИМ1-3-Т-380 (дискретно-сетевое управление)"));=
	);cond

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(100-empt-lin-le)

	(setq str-txt (strcat "Электрический исполнительный механизм ПЭМ-" str-0 str-8 ", Uпит. ~380В, потребляемая мощность " str-4 "кВт, "
												"Iном. " str-5 "А, " str-81)
	);setq
	
	(split-str-parts-le-110-01 str-txt " " pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-exec-mech-pem-a

( / cntr-1 dlt-y nmbr-ln pnt-ins str-0 str-4 str-5 str-6 str-7 str-8 str-81 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
				str-8 (cdr (assoc 8 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных
	(cond
		((= str-7 "С кулачками") (setq str-7 "с кулачками"));=
		((= str-7 "Круг, шпонка") (setq str-7 "круглого сечения, шпоночный паз"));=
	);cond

	(cond
		((= str-8 "М Блок концевых выключателей") (setq str-8 "М" str-81 "- блок концевых выключателей"));=
		((= str-8 "Р Реостатный датчик сигнализации положения") (setq str-8 "Р" str-81 "- реостатный датчик сигнализации положения"));=
		((= str-8 "И Индуктивный датчик сигнализации положения") (setq str-8 "И" str-81 "- индуктивный датчик сигнализации положения"));=
		((= str-8 "У Токовый датчик сигнализации положения") (setq str-8 "У" str-81 "- токовый датчик сигнализации положения"));=
		
		((= str-8 "КИМ1-3-А-380 Аналоговое управление") (setq str-8 "Е" str-81 "- контроллер КИМ1-3-А-380 (аналоговое управление)"));=
		((= str-8 "КИМ1-3-Д-380 Дискретное управление") (setq str-8 "Е" str-81 "- контроллер КИМ1-3-А-380 (дискретое управление)"));=
		((= str-8 "КИМ1-3-С-380 Сетевое управление") (setq str-8 "Е" str-81 "- контроллер КИМ1-3-А-380 (сетевое управление)"));=
		((= str-8 "КИМ1-3-Т-380 Дискретно-сетевое управление") (setq str-8 "Е" str-81 "- контроллер КИМ1-3-А-380 (дискретно-сетевое управление)"));=
	);cond
	
	(setq nmbr-ln 8);setq
	
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Электрический исполнительный механизм")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- выходной вал " str-7))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- электропитание напряжением 380В частотой 50 Гц")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- потребляемая мощность " str-4 "кВт, номинальный ток " str-5 "А"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-81)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "- климатическое исполнение по ГОСТ 15150 У2 (-40°С...+50°С)")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "- степень защиты IP54 по ГОСТ 14254-96")
	
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ПЭМ-" str-0 str-8)) ;Тип, марка, обозначение документа, опросного листа

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"АБС ЗЭиМ")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Автоматизация\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Чебоксары")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////