;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-dsgn-dks-s5-spcf

(list-902 / cntr-1 pnt-ins str-02 str-03 str-04 str-41 str-42 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setvar "osmode" 6199)

	(setq str-tmp (nth cntr-1 list-902)
				str-701 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				
				pnt-ins (getpoint "\nУкажите точку вставки\n")
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
	
	
	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= "Лоток перфорированный" str-701) 
					(= "Крышка лотка" str-701)
					(wcmatch str-701 "Угол*"))
					
		(setq str-04 (cdr (assoc 4 str-tmp))
					
					str-702 (list (cons 1 str-02)
												(cons 2 str-04)
									);list
											
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "компл."
		);setq
	);if
		
	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-701 "Крышка для*")			
		(setq str-702 (list (cons 1 str-02));list
											
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "шт."
		);setq
	);if
	
	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-701 "Профиль*")			
		(setq str-701 (strcat str-701 " " str-02)
		      str-04 (cdr (assoc 4 str-tmp))
		      str-702 (list (cons 1 str-03));list
											
					str-order (list (cons 1 str-04)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "шт."
		);setq
	);if

	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-701 "Консоль*")
		(setq str-701 (strcat str-701 " " str-02)
		      str-41 (cdr (assoc 41 str-tmp))
		      str-42 (cdr (assoc 42 str-tmp))
		      str-702 (list (cons 1 str-41)
		                    (cons 2 str-42)
		              );list
															
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "шт."
		);setq
	);if

	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (or (wcmatch str-701 "Ответвитель*")
					(wcmatch str-701 "Соединитель*")
			);or
		(setq str-702 (list (cons 1 str-02));list
											
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "компл."
		);setq
	);if
	
	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-701 "Переходник*")	
		(setq str-702 (list (cons 1 str-02));list
											
					str-order (list (cons 1 (strcat "размеры " str-03))
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "компл."
		);setq
	);if
	
	;;;;;;;;//////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-701 "Крепление к*")	
		(setq str-701 (strcat str-701 " " str-02)		
		      str-702 nil											
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "шт."
		);setq
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
  (if (= str-701 "Перегородка SEP")
	  (setq str-702 (list (cons 1 str-02))										
					str-order (list (cons 1 str-03)
													(cons 2 " ") 
													(cons 3 nil)
										);list

					str-unit "шт."
		);setq
  );if
   
  
	
	(setq str-manufact "АО \"ДКС\", г. Тверь");setq

	(if (/= str-701 nil)
		(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
	);if
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
