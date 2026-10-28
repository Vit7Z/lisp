;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clmp-phnix-01-general-spcf

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-700 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				str-manufact "Phoenix Contact"
				str-crtf nil
	);setq


	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Клемма Проходная")
			  (= str-01 "Клемма Защитного провода")
       	  (= str-01 "Клемма С предохранителем")
       	  (= str-01 "Клемма Электротехническая"));
		(progn
			(setq str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
					str-06 (strcase (vl-string-subst "ч" "Ч" str-06) 1)						
					str-07 (cdr (assoc 7 str-tmp))
			);setq

			(cond
				((= str-01 "Клемма Проходная") (setq str-701 "Клемма (проходная)"));=
			 	((= str-01 "Клемма Защитного провода") (setq str-701 "Клемма (для присоединения защитного провода)"));=
       		((= str-01 "Клемма С предохранителем") (setq str-701 "Клемма (с предохранителем)"));=
       		((= str-01 "Клемма Электротехническая") (setq str-701 "Клемма (сильноточная)"));=
			);cond

			(setq str-702 (list (cons 1 (strcat "сечение проводника " str-05 " мм2"))
									  (cons 2 (strcat "цвет " str-06))													
									  (cons 3 (strcat (strcase str-07 1) " зажим")));list
						
						str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
											 (cons 2 ",")
											 (cons 3 nil))
						str-unit "шт"						
			);setq
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Наконечник кабельный" str-01)
		(progn
			(setq str-05 (cdr (assoc 5 str-tmp))
						str-05 (strcase (vl-string-subst "ч" "Ч" str-05) 1)
						str-06 (cdr (assoc 6 str-tmp))							
			);setq
		
			(setq str-701 str-01
			
					str-702 (list (cons 1 (strcat "сечение жилы " str-04 "мм"))
									  (cons 2 (strcat "длина гильзы " str-06 "мм"))													
									  (cons 3 (strcat "цвет " str-05)));list
						
					str-700 (list (cons 1 str-01) 
									  (cons 2 str-702));list
						
					str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
										 (cons 2 ",")
										 (cons 3 nil))
					str-unit "шт"						
			);setq
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Полоса маркировочная" str-01)
		(progn
			(setq	str-05 (strcase (cdr (assoc 5 str-tmp)) 1)								
			
						str-701 str-01
			
						str-702 (list (cons 1 str-05)												
													(cons 2 (strcase (strcat "цвет " str-04) 1)));list
											
						str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
														(cons 2 ",")
														(cons 3 nil))
						str-unit "шт"						
			);setq
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Стопор концевой" str-01)
		(progn
			(setq str-03 (strcase (vl-string-subst "ч" "Ч" str-03) 1)
						str-04 (strcase str-04 1)						
						str-05 (cdr (assoc 5 str-tmp))						
			);setq

			(cond
				((wcmatch str-05 "*винт*") (setq str-05 "винтами"));=
				((= str-05 "Защелка") (setq str-05 "защелкой"));=
			);cond
			
			(setq str-701 str-01
			
						str-702 (list (cons 1 (strcat "крепление " str-05))
													(cons 2 (strcat "материал " str-04)));list
															
						str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
														(cons 2 ",")
														(cons 3 nil))
						str-unit "шт."						
			);setq
		);progn
	);if	

	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Соединитель поперечный" str-01)
		(progn
			(setq	str-05 (cdr (assoc 5 str-tmp)));setq
			
			(setq str-702 (list (cons 1 str-05)												
													(cons 2 (strcat "количество полюсов " str-05))
													(cons 3 (strcat "цвет " (strcase str-04 1))));list
													
						str-700 (list (cons 1 str-01) 
													(cons 2 str-702));list
						
						str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
														(cons 2 ",")
														(cons 3 nil))
						str-unit "шт."						
			);setq
		);progn
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Планка Zack (маркировка клемм)" str-01)
		(progn
			(setq	str-05 (cdr (assoc 5 str-tmp))
					str-07 (cdr (assoc 7 str-tmp))
			);setq
			
			(cond
				((= str-05 "Нет") (setq str-05 "без цифр"));=
				((= str-05 "поперек") (setq str-05 (strcat "цифры " str-07 ", расположение цифр поперек")));=
			);cond
			
			(setq	str-701 str-01						
					str-702 (list (cons 1 str-05));list
					str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
										 (cons 2 ",")
										 (cons 3 nil))
					str-unit "шт."						
			);setq
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Держатель маркировочных полос" str-01)
		(progn			
			(setq	str-05 (cdr (assoc 5 str-tmp))
			
						str-701 str-01
						
						str-702 (list (cons 1 (strcat "размер маркировочного поля " str-04 " мм, для CLIPFIX 35")));list
													
						str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
														(cons 2 ",")
														(cons 3 nil))
						str-unit "шт."						
			);setq
		);progn
	);if



	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////