;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// подпрограмма вывода в спцф                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-dkc-01-spcf

(list-902 / cntr-1 pnt-ins str-0 str-01 str-02 str-03 str-1 str-2 str-3 str-701 str-702 str-97 str-98 str-99 str-crtf str-manufact str-order str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-97 (cdr (assoc 97 str-tmp))
				str-98 (cdr (assoc 98 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////
	(if (or (= "Крыша и основание шкафа" str-01)
					(= "Дверь сплошная" str-01)
					(= "Панели боковые" str-01));or
					
		(setq str-03 (cdr (assoc 3 str-tmp))
					
					str-701 str-01
			
					str-702 (list (cons 1 str-02)
												(cons 2 str-03));list
												
					str-97 (strcat "Артикул " str-97)
		);setq
	);if


	;/////////////////////////////////////////////////////////////////////////////
	(if (or (= "Стойки вертикальные" str-01)
					(= "Цоколь (панели)" str-01)
					(= "Цоколь (элементы угловые)" str-01)
					(= "Карман для документации" str-01)
					(= "Ручка стандартная" str-01)
					(= "Зажим для кабеля" str-01))
		(setq str-701 str-01
						
					str-702 (list (cons 1 str-02));list
					
					str-97 (strcat "Артикул " str-97)
		);setq
	);if
	
	
	;/////////////////////////////////////////////////////////////////////////////
	(if (= "DIN-рейка" str-01)
		(setq str-03 (cdr (assoc 3 str-tmp))
		
					str-701 str-01
						
					str-702 (list (cons 1 str-02));list
					
					str-97 (strcat str-03 ", артикул " str-97)
		);setq
	);if


	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Кронштейн для DIN-рейки" str-01)
		(setq str-701 str-01
						
					str-702 nil
					
					str-97 (strcat str-02 ", артикул " str-97)
		);setq
	);if
























	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Держатель для шины кабельной 30/15, С-образный профиль" str-0)
		(progn
			(setq str-99 (cdr (assoc 2 str-tmp))
						
						str-701 "Держатель для шины кабельной 30/15 (С-образный профиль)"
						
						str-702 nil
																 
						str-order (list (cons 1 (strcat "Арт. № " str-1)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "компл."
			);setq
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Зажим для шины кабельной, угловой профиль" str-0)
		(progn
			(setq str-99 (cdr (assoc 3 str-tmp)));setq
			
			(setq str-701 "Зажим для шины кабельной (угловой профиль)"
						
						str-702 (list (cons 1 (strcat "для кабеля диаметром " str-1 "мм")));list
										 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
	);if

 							
	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Зажим для кабеля (крепление к С-образному профилю)" str-0)
		(progn
			(setq str-99 (cdr (assoc 3 str-tmp)));setq
			
			(setq str-701  "Зажим для кабеля (крепление к С-образному профилю)"
			
						str-702 (list (cons 1 (strcat "для кабеля диаметром " str-1 "мм")));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Замок-вкладыш" str-tmp-0)
		(progn
			(setq str-99 (cdr (assoc 2 str-tmp))
						
						str-701 "Замок предохранительный"
						
						str-702 (list (cons 1 "замок № 3524 E")
													(cons 2 "для монтажа в ручку шкафа"));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-1)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "компл."
			);setq
		);progn
	);if










	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Шина кабельная, угловой профиль" str-0)
		(progn
			(setq str-3 (cdr (assoc 3 str-tmp))
			);setq
			
			(setq str-701 "Шина кабельная (угловой профиль)"
						
						str-702 (list (cons 1 (strcat "длина " str-1 "мм")));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Шина кабельная 30/15, С-образный профиль" str-0)
		(progn
			(setq str-3 (cdr (assoc 3 str-tmp))
			);setq
		
			(setq str-701 "Шина кабельная (С-образный профиль)"
						
						str-702 (list (cons 1 (strcat "длина " str-1 "мм")));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
	);if
			
	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Шина заземления, горизонтальная" str-0)
		(progn
			(setq str-3 (cdr (assoc 3 str-tmp))
						str-99 str-3
			);setq
			
			(setq str-701 "Шина заземления горизонтальная"
						
						str-702 (list (cons 1 (strcat "длина " str-1 "мм")));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
	);if

	

	
	
	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Цоколь, фальш-панели боковые, высота 200мм" str-tmp-0)
		(progn
			(setq str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						
						str-99 str-tmp-3
			);setq
			
			(cond
				((= "RAL7022" str-tmp-4) (setq str-tmp-4 (strcat str-tmp-4 " (коричнево-серый)"))); = str-1
				((= "RAL7035" str-tmp-4) (setq str-tmp-4 (strcat str-tmp-4 " (светло-коричневый)"))); = str-1
			);cond
			
			(setq str-701 "Цоколь (фальш-панели боковые)"
						
						str-702 (list (cons 1 (strcat "для шкафа глубиной " str-tmp-1 "мм"))
													(cons 2 (strcat "высота 200мм"))
													(cons 3 (strcat "цвет " str-tmp-4)));list
											 
						str-order (list (cons 1 (strcat "Арт. № " str-tmp-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "компл."
			);setq
		);progn
	);if
								
	(setq str-unit str-98
	
				str-manufact "ДКС"
				
				str-crtf nil
				
				str-order (list (cons 1 str-97) 
												(cons 2 " ") 
												(cons 3 nil));list
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
