;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-constr-iek-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-1001 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
 
      list-901 nil
      list-902 nil
);setq

(read-file-for-dialog-box-01 "101-08-cbl-constr-iek-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(tmp-start-101-08-cbl-constr-iek-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-08-cbl-constr-iek-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_cbl_dsgn_iek" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(tmp-start-101-08-cbl-constr-iek-01-general)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-cbl-constr-iek-01-general)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"ledae\")"
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

(if (= type-list "ledae") (tmp-ledae-101-08-cbl-constr-iek-01-general));if
(if (= type-list "spcf") (tmp-spcf-101-08-cbl-constr-iek-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-08-cbl-constr-iek-01-general

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-1001-read-file name-file-1 num-flds)

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
	((= str-01 "Консоль")
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Длина, мм")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "Несущая")
			(set_tile "ptxt-052" "способность,")
			(set_tile "ptxt-053" "кг")
		);progn
	);str-1

	((or (= str-01 "Кронштейн настенный")
			 (= str-01 "Кронштейн замковый") 
			 (= str-01 "Кронштейн"));or
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Длина, мм")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "Рабочая")
			(set_tile "ptxt-052" "нагрузка,")
			(set_tile "ptxt-053" "Н")	
		);progn
	); str-1

	((= str-01 "Профиль перфорированный")
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Длина, мм")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	); str-1

	((or (= str-01 "Скоба потолочная") 
			 (= str-01 "Втулка в профиль перфорированный"));or
		(progn
			(set_tile "ptxt-021" "Артикул")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	); str-1

	((= str-01 "Лоток перфорированный")
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "(ВхШхД),")
			(set_tile "ptxt-023" "мм")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Толщина")
			(set_tile "ptxt-042" "стенки,")
			(set_tile "ptxt-043" "мм")
			(set_tile "ptxt-051" "Полезная")
			(set_tile "ptxt-052" "нагрузка,")
			(set_tile "ptxt-053" "кг/м")
		);progn
	); str-1

	((= str-01 "Крышка на лоток")
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "(ШхД)")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Размеры")
			(set_tile "ptxt-042" "(ШхД), мм")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	); str-1

	((or (= str-01 "Поворот на 90° гориз.") 
			 (= str-01 "Поворот на 90° верт. внешний (вниз)")
			 (= str-01 "Поворот на 90° верт. внутр. (вверх)")
			 (= str-01 "Разветвитель Т-образный")
			 );or
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "(ВхШ)")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Размеры")
			(set_tile "ptxt-042" "(ВхШ), мм")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	); str-1

	((or (= str-01 "Пластина соединительная")
			 (= str-01 "Пластина шарнирного соединения")
			 (= str-01 "Перегородка разделительная"));
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "(ВхД)")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "Размеры")
			(set_tile "ptxt-042" "(ВхД), мм")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	); str-1

	( (or (= str-01 "Комплект соединительный") 
				(= str-01 "Гайка со стопорным буртом") 
				(= str-01 "Болт со стопорным буртом")
				(= str-01 "Соединитель перфорированный"));or
		(progn
			(set_tile "ptxt-021" "Типоразмер")
			(set_tile "ptxt-022" "")
			(set_tile "ptxt-023" "")
			(set_tile "ptxt-031" "Артикул")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")			
			(set_tile "ptxt-041" "")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
		);progn
	);str-1
);cond

(read-file-for-dialog-box-01 name-file-1 num-flds)

(divide-text-into-parts-02-list-text list-1001-read-file 180)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-99 list-05-read-file
			list-1001 list-1001-read-file
);setq

(cond
	((or (= str-01 "Комплект соединительный")
			 (= str-01 "Гайка со стопорным буртом")
			 (= str-01 "Болт со стопорным буртом")
			 (= str-01 "Соединитель перфорированный")
	 );or
		(setq list-04 nil
					list-99 list-03-read-file
		);setq
	);=

	((or (= str-01 "Скоба потолочная") 
			 (= str-01 "Втулка в профиль перфорированный")
	);or
		(setq list-03 nil
					list-99 list-02-read-file
		);setq
	);=

	((or (= str-01 "Профиль перфорированный") 
			 (= str-01 "Крышка на лоток")
			 (= str-01 "Поворот на 90° гориз.") 
			 (= str-01 "Поворот на 90° верт. внешний (вниз)")
			 (= str-01 "Поворот на 90° верт. внутр. (вверх)")
			 (= str-01 "Разветвитель Т-образный")
			 (= str-01 "Пластина соединительная")
			 (= str-01 "Пластина шарнирного соединения")
			 (= str-01 "Перегородка разделительная")
		);or		
		(setq list-05 nil
					list-99 list-04-read-file
		);setq
	); str-1

); cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-cbl-constr-iek-01-general

( / str-01 str-02 str-03 str-04 str-99 swtch tmp-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
      swtch list-901
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond
	((or (= str-01 "Консоль")
			 (= str-01 "Кронштейн настенный")
			 (= str-01 "Кронштейн замковый")
			 (= str-01 "Кронштейн")
			 (= str-01 "Профиль перфорированный")
			 (= str-01 "Крышка на лоток")
			 (= str-01 "Поворот на 90° гориз.") 
			 (= str-01 "Поворот на 90° верт. внешний (вниз)")
			 (= str-01 "Поворот на 90° верт. внутр. (вверх)")
			 (= str-01 "Разветвитель Т-образный")
			 (= str-01 "Пластина соединительная")
			 (= str-01 "Пластина шарнирного соединения")
			 (= str-01 "Перегородка разделительная")
		);or

		(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
						
					list-901 (vl-list* (strcat str-01 "  " str-03 "  " str-04) list-901)
					tmp-902 (list (cons 1 str-01) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
		);setq
	);=

	((or (= str-01 "Комплект соединительный") 
			 (= str-01 "Гайка со стопорным буртом") 
			 (= str-01 "Болт со стопорным буртом")
			 (= str-01 "Соединитель перфорированный"));or
			 
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
						
					list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03) list-901)
					tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
		);setq
	);=

	((= str-01 "Лоток перфорированный")
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
						
					list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  " str-04) list-901)
					tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
		);setq
	);=

	((or (= str-01 "Втулка в профиль перфорированный")
			 (= str-01 "Скоба потолочная")
		);or

		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
						
					list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-99) list-901)
					tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-99))
		);setq
	);=
); cond
	
(setq list-902 (vl-list* tmp-902 list-902));setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ЧРО               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-ledae-101-08-cbl-constr-iek-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-99 str-tmp str-txt x-pnt-ins y-pnt-ins)

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
	);setq
	
	(09-empt-lin-le-cgv)

	;;;;;;;///////////////////////////////////////////////////////////////////////
	(if (or (= "Консоль" str-01)
					(= "Кронштейн настенный" str-01)
					(= "Кронштейн замковый" str-01)
					(= "Кронштейн" str-01)
					(= "Профиль перфорированный" str-01)
			);or
		(setq str-txt (strcat str-01 " IEK, артикул " str-03 ", длина " str-04 "мм"));setq
	);if

	(if (or (= "Скоба потолочная" str-01)
					(= "Втулка в профиль перфорированный" str-01)
					(= "Комплект соединительный" str-01)
					(= "Гайка со стопорным буртом" str-01)
					(= "Болт со стопорным буртом" str-01)
					(= "Соединитель перфорированный" str-01)
			);or
		(setq str-txt (strcat str-01 " IEK, артикул " str-02));setq
	);if

	(if (= "Лоток перфорированный" str-01)
		(setq str-txt (strcat str-01 " IEK, артикул " str-03 ", размеры " str-02 " (ВхШхД, мм), толщина стенки " str-04 "мм"));setq
	);if

	(if (= "Крышка на лоток" str-01)
		(setq str-txt (strcat str-01 " IEK, артикул " str-03 ", размеры " str-04 " (ШхД, мм)"));setq
	);if

	(if (= "Поворот на 90° гориз." str-01)
		(setq str-txt (strcat "Поворот на 90° (горизонтальный) IEK, артикул " str-03 ", размеры " str-04 " (ВхШ, мм)"));setq
	);if

	(if (= "Поворот на 90° верт. внешний (вниз)" str-01)
		(setq str-txt (strcat "Поворот на 90° (вертикальный, внешний, вниз) IEK, артикул " str-03 ", размеры " str-04 " (ВхШ, мм)"));setq
	);if

	(if (= "Поворот на 90° верт. внутр. (вверх)" str-01)
		(setq str-txt (strcat "Поворот на 90° (вертикальный, внутренний, вверх) IEK, артикул " str-03 ", размеры " str-04 " (ВхШ, мм)"));setq
	);if
	
	(if (= "Разветвитель Т-образный" str-01)
		(setq str-txt (strcat str-01 " IEK, артикул " str-03 ", размеры " str-04 " (ВхШ, мм)"));setq
	);if
	
	(if (or (= "Пластина соединительная" str-01)
					(= "Пластина шарнирного соединения" str-01)
					(= "Перегородка разделительная" str-01)
			);or
		(setq str-txt (strcat str-01 " IEK, артикул " str-03 ", размеры " str-04 " (ВхД, мм)"));setq
	);if
	
	(split-str-parts-lecgv-65-01 str-txt pnt-ins)
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- y-pnt-ins 4)) 2.5 0 str-99)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-cbl-constr-iek-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit x-pnt-ins y-pnt-ins)

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
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;обработка данных
	(if (or (= "Консоль" str-01)
					(= "Кронштейн настенный" str-01)
					(= "Кронштейн замковый" str-01)
					(= "Кронштейн" str-01)
					(= "Профиль перфорированный" str-01)
			);or

		(setq str-701 str-01
						
					str-702 (list (cons 1 (strcat "длина " str-04 "мм")));list
						
					str-order (list (cons 1 (strcat "Артикул " str-03)) 
										(cons 2 " ") 
										(cons 3 nil));list
			
					str-unit "шт."	
			);setq
	);if
















	(if (or (= "Скоба потолочная" str-01)
					(= "Втулка в профиль перфорированный" str-01)
			);or
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-01)
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Артикул " str-02))
		);progn
	);if
	
	
	
	
	(if (= "Лоток перфорированный" str-01)
		(setq str-701 str-01
						
					str-702 (list (cons 1 (strcat "размеры (ВхШхД) " str-02 "мм"))
												(cons 2 (strcat "толщина стенки " str-04 "мм")));list
						
					str-order (list (cons 1 (strcat "Артикул " str-03)) 
										(cons 2 " ") 
										(cons 3 nil));list
			
					str-unit "компл."	
			);setq
	);if


	(if (= "Крышка на лоток" str-01)
		(setq str-701 str-01
						
					str-702 (list (cons 1 (strcat "размеры (ШхД) " str-04 "мм")));list
						
					str-order (list (cons 1 (strcat "Артикул " str-03)) 
										(cons 2 " ") 
										(cons 3 nil));list
			
					str-unit "компл."	
			);setq
	);if
	

	(if (or (= "Поворот на 90° гориз." str-01)
					(= "Поворот на 90° верт. внешний (вниз)" str-01)
					(= "Поворот на 90° верт. внутр. (вверх)" str-01)
					(= "Разветвитель Т-образный" str-01)
			);or
			
		(progn		
			(cond
				((= "Поворот на 90° гориз." str-01) (setq str-701 "Поворот на 90° (горизонтальный)"));=
				((= "Поворот на 90° вер. внешний (вниз)" str-01) (setq str-701 "Поворот на 90° (вертикальный, внешний, вниз)"));=
				((= "Поворот на 90° верт. внутр. (вверх)" str-01) (setq str-701 "Поворот на 90° (вертикальный, внутренний, вверх)"));=
				((= "Разветвитель Т-образный" str-01) (setq str-701 "Разветвитель Т-образный"));=
			);cond

			(setq str-702 (list (cons 1 (strcat "размеры (ШхД) " str-04 "мм")));list
						
						str-order (list (cons 1 (strcat "Артикул " str-03)) 
											(cons 2 " ") 
											(cons 3 nil));list
			
						str-unit "компл."	
			);setq
		);progn
	);if


	(if (or (= "Пластина соединительная" str-01)
					(= "Пластина шарнирного соединения" str-01)
					(= "Перегородка разделительная" str-01)
			);or
			
		(setq str-701 str-01
		
					str-702 (list (cons 1 (strcat "размеры (ШхД) " str-04 "мм")));list
						
					str-order (list (cons 1 (strcat "Артикул " str-03)) 
										(cons 2 " ") 
										(cons 3 nil));list
			
					str-unit "шт."	
		);setq
	);if
	
	
	
	
	
	
	
	
	
	(if (or (= "Комплект соединительный" str-01)
					(= "Гайка со стопорным буртом" str-01)
					(= "Болт со стопорным буртом" str-01)
					(= "Соединитель перфорированный" str-01)
			);
		
		(setq str-701 str-01
					
					str-702 nil
						
					str-order (list (cons 1 (strcat "Артикул " str-03)) 
										(cons 2 " ") 
										(cons 3 nil));list
			
					str-unit "шт."	
		);setq
	);if
	
	
	
	
	
	
	
	(setq str-manufact "Группа компаний IEK, г. Москва"
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


