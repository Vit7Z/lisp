;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// подпрограмма вывода в овш                                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-rittal-03-lecgv

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-06 str-07 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Корпус шкафа" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
				 
				 	str-701 (strcat str-01 " Rittal, артикул " str-02 ", размеры (ШхВхГ, мм) " str-03 ", цвет " str-04)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Стенки боковые" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
			
					str-701 (strcat str-01 " Rittal, артикул " str-02 ", размеры (ВхГ, мм) " str-03 ", цвет " str-04)
					str-702 nil
					str-703 "Кол. в комплектах"		
		);setq
	);if

	;;;;;;;;;/////////
  (if (= "Карман для документации" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
		
					str-701 (strcat "Карман для документации Rittal, артикул " str-03 ", размеры (ШхГ, мм) " str-02 "х" str-04)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Цоколь, эл. передние и задние" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-07 (cdr (assoc 7 str-tmp))
					
					str-701 (strcat "Цоколь (элементы передние и задние) Rittal, артикул " str-04 ", размер (ШхВ, мм) " str-02 "х" str-03 ", цвет " str-07)
					str-702 nil
					str-703 "Кол. в компл."					
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Цоколь, эл. боковые" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-07 (cdr (assoc 7 str-tmp))
					
					str-701 (strcat "Цоколь (элементы боковые) Rittal, артикул " str-04 ", размер (ШхВ, мм) " str-02 "х" str-03 ", цвет " str-07)
					str-702 nil
					str-703 "Кол. в компл."
		);setq
	);if

	;;;;;;;;;/////////
  (if (= "Ручка для двери" str-01)
		(setq str-06 (cdr (assoc 6 str-tmp))			
					str-701 (strcat "Ручка комфортная Rittal, артикул " str-02 ", цвет " str-06)								
		);setq
	);if

	;;;;;;;;;/////////
  (if (= "Замок для двери" str-01)
		(setq str-701 (strcat "Замок предохранительный Rittal, артикул " str-02)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Шина заземления" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-701 (strcat "Шина заземления (горизонтальная) Rittal, артикул " str-03 ", для шкафа шириной (глубиной) " str-02 "мм")		
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Шина кабельная 30/15" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-701 (strcat "Шина кабельная (С-образный профиль) Rittal, артикул " str-03 ", ширина " str-02 "мм")		
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Держатель (для шины 30/15)" str-01)
		(setq str-701 (strcat "Держатель для шины кабельной Rittal, артикул " str-02)
					str-702 nil
					str-703 "Кол. в компл., в компл. 6 шт."
		);setq
	);if

	;;;;;;;;;/////////
  (if (= "Зажим для кабеля (крепл. к шине 30/15)" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-701 (strcat "Зажим для кабеля (крепл. к шине кабельной с С-образным профилем) Rittal, артикул " str-03 ", для кабеля диаметром " str-02 "мм")
					str-702 nil
					str-703 "Кол. в уп., в уп. 25шт."
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Полка приборная" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					
					str-701 (strcat str-01 " Rittal, артикул " str-03 ", для шкафа шириной " str-02 "мм, глубина " str-04 "мм")		
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Направляющие (для полки приборн.)" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
		
					str-701 (strcat "Направляющие телескопические Rittal, артикул " str-03 ", для полки приборной глубиной " str-02 "мм")		
					str-702 nil
					str-703 "Кол. в компл."
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Шасси системные" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
		
					str-701 (strcat "Шасси системные Rittal, артикул " str-03 ", для шкафа шириной (глубиной) " str-02 "мм")		
					str-702 nil
					str-703 "Кол. в компл., в компл. 4 шт."
		);setq
	);if

	;;;;;;;;;/////////
	(if (= "Держатель (для кабеля)" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
		
					str-701 (strcat "Держатель (для кабеля) Rittal, артикул " str-02 ", для шкафа глубиной " str-01 "мм")		
					str-702 nil
					str-703 nil
		);setq
	);if


	;;;;;;;;;/////////
	(if (= "Панель для ввода кабеля" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
		
					str-701 (strcat "Панель для ввода кабеля Rittal, артикул " str-02 ", для шкафа шириной " str-03 "мм")		
					str-702 nil
					str-703 "Кол. в компл."
		);setq
	);if
	
	;;;;;;;;;/////////
	(if (= "Кабельный ввод" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					
					str-701 (strcat "Кабельный ввод Rittal, артикул " str-02 ", макс. диаметр кабеля " str-03 "мм")		
					str-702 nil
					str-703 "Кол. в уп., в уп. 25шт."
		);setq
	);if
	
	



	

	
	
	
	
	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
