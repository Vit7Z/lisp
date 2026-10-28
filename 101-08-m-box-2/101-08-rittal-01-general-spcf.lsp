;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// подпрограмма вывода в спцф                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-rittal-01-general-spcf

(list-902 / cntr-1 pnt-ins str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Корпус шкафа" str-1)
		(setq str-2 (cdr (assoc 2 str-tmp))
					str-3 (cdr (assoc 3 str-tmp))
					str-6 (cdr (assoc 6 str-tmp))
						
					str-701 "Корпус шкафа"
			
					str-702 (list (cons 1 (strcat "размеры (ШхВхГ, мм) " str-2))
												(cons 2 (strcat "цвет " str-6))
												(cons 3 "комплектно с дверю, монтажной панелью"));list
																	 
					str-order (list (cons 1 (strcat "Арт. № " str-3)) 
													(cons 2 ",") 
													(cons 3 nil));list
														
					str-unit "компл."
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Стенки боковые" str-1)
		(setq str-2 (cdr (assoc 2 str-tmp))
					str-3 (cdr (assoc 3 str-tmp))
					str-5 (cdr (assoc 5 str-tmp))
			
					str-701 "Стенки боковые"
						
					str-702 (list (cons 1 (strcat "размеры (ШхВхГ, мм) " str-2))
												(cons 2 (strcat "цвет " str-5)));list
											 
					str-order (list (cons 1 (strcat "Арт. № " str-3)) 
													(cons 2 ",") 
													(cons 3 nil));list
														
					str-unit "компл."
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Ручка для двери" str-1)
		(setq str-2 (cdr (assoc 2 str-tmp))
					str-6 (cdr (assoc 6 str-tmp))
					
					str-701 "Ручка для двери"
						
					str-702 (list (cons 1 (strcat "цвет " str-6)));list
											 
					str-order (list (cons 1 (strcat "Арт. № " str-2)) 
													(cons 2 ",") 
													(cons 3 nil));list
														
					str-unit "шт."
		);setq
	);if































	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Цоколь, эл. передние и задние" str-0)
		(setq str-4 (cdr (assoc 4 str-tmp))
					str-5 (cdr (assoc 5 str-tmp))	
					str-6 (cdr (assoc 6 str-tmp))
			
					str-701 "Цоколь (элементы передние и задние)"
						
					str-702 (list (cons 1 (strcat "для шкафа шириной " str-1 "мм"))
												(cons 2 (strcat "высота " str-6))
												(cons 3 (strcat "цвет " str-5)));list
											 
					str-order (list (cons 1 (strcat "Арт. № " str-2)) 
													(cons 2 ",") 
													(cons 3 nil));list
														
					str-unit "компл."
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////
	(if (= "Карман для документации" str-0)
		(progn
			(setq str-4 (cdr (assoc 4 str-tmp))
			);setq
			
			(setq str-701 "Карман для документации"
						
						str-702 (list (cons 1 (strcat "для двери шириной " str-1 "мм"))
													(cons 2 (strcat "глубина " str-4 "мм")));list
												 
						str-order (list (cons 1 (strcat "Арт. № " str-2)) 
														(cons 2 ",") 
														(cons 3 nil));list
														
						str-unit "шт."
			);setq
		);progn
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
								
	(setq str-manufact "Rittal"
				str-crtf nil
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
