;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mtl-cs-iek

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-05 list-901 list-902 str-1 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-00 (list "DIN-рейка" 
      							"Кабель-канал перфорированный" 
      							"Наконечник-гильза Е" 
      							"Наконечник-гильза НГИ2"
      							"Шина нулевая с DIN-изолятором"
      							"Щит с монтажной панелью ЩМП"
      							"Щиток освещения ОЩВ"
      							
      				)
      list-901 nil
      list-902 nil

			str-1 nil
);setq

(tmp-start-101-08-mtl-cs-iek)

(if (< (setq dcl-id (load_dialog "dia-101-08-mtl-cs-iek.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_accessories_iek" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-00"
  (strcat "(tmp-start-101-08-mtl-cs-iek)"
  );srcat
);action_tile

(action_tile "txt-01"
  (strcat "(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
  				"(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(list-filling \"txt-01\" list-01)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
  				"(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(list-filling \"txt-01\" list-01)"
					"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
  				"(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-mtl-cs-iek)");strcat
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

(action_tile "but5"
  (strcat "(delete-item)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-08-mtl-cs-iek));if
(if (= type-list "spcf") (tmp-spcf-101-08-mtl-cs-iek));if
(if (= type-list "lecgv") (tmp-lecgv-101-08-mtl-cs-iek));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-08-mtl-cs-iek

()

(if (= nil str-1) 
	(setq str-1 "DIN-рейка");setq
	(setq str-1 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-1 "DIN-рейка")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-din-lath.txt" 3)
			(set_tile "ptxt-011" "Длина, мм")
			(set_tile "ptxt-012" "")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Артикул")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Масса,")
			(set_tile "ptxt-032" "кг")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")	
			(set_tile "ptxt-061" "")		
		);progn
	);=
	
	((= str-1 "Кабель-канал перфорированный")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-cable-channel-impact.txt" 3)
			(set_tile "ptxt-011" "Размеры")
			(set_tile "ptxt-012" "ШхВ, мм")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Артикул")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Серия")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")	
			(set_tile "ptxt-061" "")		
		);progn
	); str-1 "DIN-рейка"

	((= str-1 "Наконечник-гильза Е")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-tip-sleeve-e.txt" 4)
			(set_tile "ptxt-011" "Обозначение")
			(set_tile "ptxt-012" "")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Артикул")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Сечение")
			(set_tile "ptxt-032" "провода,")
			(set_tile "ptxt-033" "мм2")
			(set_tile "ptxt-041" "Цвет")
			(set_tile "ptxt-042" "изоляции")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")	
			(set_tile "ptxt-061" "Для оконцевания 1 проводника")		
		);progn
	);=

	((= str-1 "Наконечник-гильза НГИ2")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-tip-sleeve-ngig2.txt" 4)
			(set_tile "ptxt-011" "Обозначение")
			(set_tile "ptxt-012" "")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Артикул")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Сечение")
			(set_tile "ptxt-032" "провода,")
			(set_tile "ptxt-033" "мм2")
			(set_tile "ptxt-041" "Цвет")
			(set_tile "ptxt-042" "изоляции")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "Для оконцевания 2 проводников")			
		);progn
	);=

	((= str-1 "Щит с монтажной панелью ЩМП")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-case-shmp.txt" 5)
			(set_tile "ptxt-011" "Наименование")
			(set_tile "ptxt-012" "")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Размеры")
			(set_tile "ptxt-022" "(ВхШхГ), мм")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Панель")
			(set_tile "ptxt-032" "(ВхШхГ), мм")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "Артикул")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "Масса,")
			(set_tile "ptxt-052" "кг")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "")			
		);progn
	);=

	((= str-1 "Щиток освещения ОЩВ")
		(progn
			(read-file-for-dialog-box "101-08-mtl-cs-iek-case-ochv.txt" 5)
			(set_tile "ptxt-011" "Наименование")
			(set_tile "ptxt-012" "")
			(set_tile "ptxt-013" "")
			(set_tile "ptxt-021" "Размеры")
			(set_tile "ptxt-022" "(ВхШхГ), мм")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Вводной авт., А/")
			(set_tile "ptxt-032" "Выводные авт, А/")
			(set_tile "ptxt-033" "Кол. выводных авт.")
			(set_tile "ptxt-041" "Артикул")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "Масса,")
			(set_tile "ptxt-052" "кг")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "Навесной")			
		);progn
	);=
	
	

);cond

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
	
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")



(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-mtl-cs-iek

( / cntr-1 str-00 str-01 tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-spcf)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (get_tile "txt-01")
      cntr-1 0 
);setq
  
(setq str-01 (strcat "(" str-01 ")");преобразуем строку в список
      str-01 (read str-01)
);setq

(if (/= list-901 nil)
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(repeat (length str-01)
  (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01);извлекаем элемент из списка элементов лист-1 по номеру элемента из списка тмп? формируем список обозначений
        tmp-str-02 (nth (nth cntr-1 str-01) list-02) 
  );setq

	(if (= list-03 nil)
		(setq tmp-str-03 "***");setq
		(setq tmp-str-03 (nth (nth cntr-1 str-01) list-03));setq
	);if

	(if (= list-04 nil)
		(setq tmp-str-04 "***");setq
		(setq tmp-str-04 (nth (nth cntr-1 str-01) list-04));setq
	);if
	
	(if (= list-05 nil)
		(setq tmp-str-05 "***");setq
		(setq tmp-str-05 (nth (nth cntr-1 str-01) list-05));setq
	);if

  (setq tmp-str-spcf (list (cons 0 str-00) (cons 1 tmp-str-01) (cons 2 tmp-str-02) (cons 3 tmp-str-03) (cons 4 tmp-str-04) (cons 5 tmp-str-05))
  			list-902 (vl-list*  tmp-str-spcf list-902);список характеристик для спецификации
	);setq

	(if (or (= str-00 "DIN-рейка")
					(= str-00 "Кабель-канал перфорированный"))
		(setq list-901 (vl-list* (strcat str-00 " " tmp-str-01) list-901));setq
	);if

	(if (= str-00 "Щит с монтажной панелью ЩМП")
		(setq list-901 (vl-list* (strcat "Щит с монтажной панелью " tmp-str-01 "  "
																		 "(ВхШхГ) " tmp-str-02 "мм  "
																		 "Панель (ВхШ) " tmp-str-03 "мм") list-901));setq
	);if

	(if (= str-00 "Щиток освещения ОЩВ")
		(progn
			(setq list-901 (vl-list* (strcat "Щиток освещения " tmp-str-01 "  "
																		 	"(ВхШхГ) " tmp-str-02 "мм  "
																		 	"Панель (ВхШ) " tmp-str-03) list-901));setq
		);progn
	);if

	(if (= (substr str-00 1 (vl-string-search " " str-00)) "Наконечник-гильза")		
		(setq list-901 (vl-list* (strcat str-00 "  " 
																		 "Обозн. " tmp-str-01 "  "
																		 "Сечение провода " tmp-str-03 "  "
																		 "Цвет " tmp-str-04 "  ") list-901)
		);setq
	);if

  (setq cntr-1 (1+ cntr-1));setq
);repeat

(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq


(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-08-mtl-cs-iek

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-3-d str-tmp-3-d-1 str-tmp-3-d-2 str-tmp-3-d-3 str-tmp-4 str-tmp-5 str-txt str-txt-01 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
		

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "DIN-рейка" str-tmp-0)
		(setq str-txt (strcat "DIN-рейка IEK, артикул " str-tmp-2 ", длина " str-tmp-1)
					str-txt-01 nil
		);setq
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Кабель-канал перфорированный" str-tmp-0)
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
						
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кабель-канал перфорированный IEK, артикул")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-2 ", размеры ШхВ " str-tmp-1 "мм,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "серия \"" str-tmp-3 "\""))
		);progn
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Щит с монтажной панелью ЩМП" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
						
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Щит с монтажной панелью IEK, " str-tmp-1 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-4 ", размеры (ВхШхГ) " str-tmp-2 "мм"))
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Щиток освещения ОЩВ" str-tmp-0)
		(progn
			(setq str-tmp-3-d str-tmp-3
						str-tmp-3-d-1 (substr str-tmp-3-d 1 (vl-string-search "/" str-tmp-3-d));1 \\
						str-tmp-3-d (substr str-tmp-3-d (+ (vl-string-search "/" str-tmp-3-d) 2))
						str-tmp-3-d-2 (substr str-tmp-3-d 1 (vl-string-search "/" str-tmp-3-d));1 \\
						str-tmp-3-d (substr str-tmp-3-d (+ (vl-string-search "/" str-tmp-3-d) 2))
						str-tmp-3-d-3 (substr str-tmp-3-d 1 (vl-string-search " " str-tmp-3-d));1 \\
				);setq

			(setq nmbr-ln 5);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
						
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Щиток освещения IEK, " str-tmp-1 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-4 ", размеры (ВхШхГ) " str-tmp-2 "мм,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "вводной авт. выключатель Iном.=" str-tmp-3-d-1 "А,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "отходящих линий " str-tmp-3-d-3 " шт. (" str-tmp-3-d-2 "А)"))			
		);progn
	);if


 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-mtl-cs-iek

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-3-d str-tmp-3-d-1 str-tmp-3-d-2 str-tmp-3-d-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
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
	(if (= "DIN-рейка" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "DIN-рейка")
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-0 " (" str-tmp-1 ") оцинкованная,"))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-2))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-tmp-1))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3);масса
		);progn
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Кабель-канал перфорированный" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кабель-канал перфорированный")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- размеры (ШхВ) " str-tmp-1 "мм"))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Кабель-канал " str-tmp-1 " \"" str-tmp-3 "\","))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-2))
			
		);progn
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= (substr str-tmp-0 1 (vl-string-search " " str-tmp-0)) "Наконечник-гильза")
		(progn
			(if (= str-tmp-4 "Черный") (setq str-tmp-4 "черный"));if
			
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (substr str-tmp-0 1 (vl-string-search " " str-tmp-0)))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- сечение проводника " str-tmp-3 "мм2"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- цвет " (strcase str-tmp-4 1)))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 ","))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-2))		
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Щит с монтажной панелью ЩМП" str-tmp-0)
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Щит с монтажной панелью")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- размеры (ВхШхГ) " str-tmp-2 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- размеры монтажной панели (ВхШ) " str-tmp-3 "мм"))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 ","))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-4))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-5);масса
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Щиток освещения ОЩВ" str-tmp-0)
		(progn
			(setq str-tmp-3-d str-tmp-3
						str-tmp-3-d-1 (substr str-tmp-3-d 1 (vl-string-search "/" str-tmp-3-d));1 \\
						str-tmp-3-d (substr str-tmp-3-d (+ (vl-string-search "/" str-tmp-3-d) 2))
						str-tmp-3-d-2 (substr str-tmp-3-d 1 (vl-string-search "/" str-tmp-3-d));1 \\
						str-tmp-3-d (substr str-tmp-3-d (+ (vl-string-search "/" str-tmp-3-d) 2))
						str-tmp-3-d-3 (substr str-tmp-3-d 1 (vl-string-search " " str-tmp-3-d));1 \\
				);setq

			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Щиток освещения")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- вводной авт. выключатель Iном.=" str-tmp-3-d-1 "А, отходящих линий " str-tmp-3-d-3 " шт. (" str-tmp-3-d-2 "А)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- размеры (ВхШхГ) " str-tmp-2 "мм"))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1 ","))
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-4))	
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-5);масса
		);progn
	);if

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "IEK, г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ОВШ               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-08-mtl-cs-iek

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "DIN-рейка" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "DIN-рейка IEK, артикул")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-2 ", длина " str-tmp-1))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3)
		);progn
	);if

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (= "Кабель-канал перфорированный" str-tmp-0)
		(progn
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кабель-канал перфорированный IEK,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-2 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "размеры (ШхВ) " str-tmp-1 "мм,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "серия \"" str-tmp-3 "\""))
		);progn
	);if
	
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (= (substr str-tmp-0 1 (vl-string-search " " str-tmp-0)) "Наконечник-гильза")
		(progn
			(if (= str-tmp-4 "Черный") (setq str-tmp-4 "черный"));if
			
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat (substr str-tmp-0 1 (vl-string-search " " str-tmp-0)) " IEK, " str-tmp-1 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-tmp-2 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "диаметр провода " str-tmp-3 "мм2,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "цвет " (strcase str-tmp-4 1)))
		);progn
	);if
	
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (= "Щит с монтажной панелью ЩМП" str-tmp-0)
		(progn
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Щит с монтажной панелью IEK,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-1 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-4 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "размеры (ВхШхГ) " str-tmp-2 "мм"))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-5)
		);progn
	);if
	
	
		
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
