;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clmp-phnix-01-general-le

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-03 (cdr (assoc 3 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Клемма Проходная")
			  (= str-01 "Клемма Защитного провода")
       	  (= str-01 "Клемма С предохранителем")
       	  (= str-01 "Клемма Электротехническая"));
       		
		(setq str-01 (strcase str-01 1)
				str-01 (vl-string-subst "Клемма" "клемма" str-01)
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-06 (strcase (vl-string-subst "ч" "Ч" str-06) 1)					
				str-07 (cdr (assoc 7 str-tmp))

				str-701 (strcat str-01 ", " str-02 ", артикул " str-03 ", сечение проводника " str-05 " мм2, цвет " str-06 ", " (strcase str-07 1) " зажим")
				str-702 nil			
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Наконечник кабельный" str-01)
		(setq str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-05 (strcase (vl-string-subst "ч" "Ч" str-05) 1)
				str-06 (cdr (assoc 6 str-tmp))	
					
				str-701 (strcat str-01 ", " str-02 ", артикул " str-03 ", сечение проводника " str-04 "мм2, цвет " str-05 ", длина гильзы " str-06 " мм")
				str-702 nil									
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Стопор концевой" str-01)
		(progn
			(setq str-04 (cdr (assoc 4 str-tmp))
					str-04 (strcase str-04 1)		
					str-05 (cdr (assoc 5 str-tmp))			
			);setq
			
			(cond
				((wcmatch str-05 "*винт*") (setq str-05 "винтами"));=
				((= str-05 "Защелка") (setq str-05 "защелкой"));=
			);cond
			
			(setq str-701 (strcat str-01 ", " str-02 ", артикул " str-03 ", крепление " str-05 ", материал " str-04)
					str-702 nil
			);setq
		);progn
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Планка Zack (маркировка клемм)" str-01)
		(progn
			(setq str-05 (cdr (assoc 5 str-tmp)));setq
			
			(if (wcmatch str-02 "ZB #:UNBEDRUCKT")
				(setq str-701 (strcat "Планка Zack (маркировка клемм) Phoenix Contact " str-02 ", артикул " str-03 ", " str-05)
						str-702 nil
				);setq
			);if

			(if (wcmatch str-02 "ZB # QR:FORTL.ZAHLEN")
				(setq str-07 (cdr (assoc 7 str-tmp))
						str-701 (strcat "Планка Zack (маркировка клемм) Phoenix Contact " str-02 ", артикул " str-03 ", цифры " str-07 ", расположение символов " str-05)	
						str-702 nil				
				);setq
			);if
		);progn
	);if

	
	
	
	
;
;	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
;	(if (= "Соединитель поперечный" str-00)
;		(progn
;			(setq str-03 (cdr (assoc 3 str-tmp))
;						str-03 (strcase (vl-string-subst "ч" "Ч" str-03) 1)
;						str-04 (cdr (assoc 4 str-tmp))
;						str-04 (strcase str-04 1)										
;			);setq
;			
;			(setq nmbr-ln 4);setq
;					
;			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
;			
;			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Соединитель поперечный, " str-01 ","))
;			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-02 ", цвет " str-03 ", количество полюсов " str-04))
;		);progn
;	);if
;
;

;	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
;	(if (= "Крышка концевая" str-tmp-0)
;		(progn
;					
;			(cond
;				((= "Для 1 ур. клемм" str-tmp-4) (setq str-tmp-4 "для одноуровневых клемм"));=
;				((= "Для 2-х ур. клемм" str-tmp-4) (setq str-tmp-4 "для двухуровневых клемм"));=
;				((= "Для силовых клемм" str-tmp-4) (setq str-tmp-4 "для силовых клемм"));=
;			);cond
;					
;			(setq nmbr-ln 3
;						str-tmp-1 (strcat str-tmp-0 " Phoenix Contact " str-tmp-1 ",")
;						str-tmp-2 (strcat "артикул " str-tmp-2 ", цвет " str-tmp-3 ", " str-tmp-4)
;			);setq
;		);progn
;	);if

;	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////	
;	(if (= "Держатель для маркировочных табличек" str-tmp-0)
;		(progn
;			(if (= "Черный" str-tmp-3) (setq str-tmp-3 "черный"));if
;			
;			(setq nmbr-ln 3
;						str-tmp-1 (strcat str-tmp-0 " Phoenix Contact " str-tmp-1 ",")
;						str-tmp-2 (strcat "артикул " str-tmp-2 ", цвет " (strcase str-tmp-3 1) ", " (strcase str-tmp-4 1))
;			);setq
;		);progn
;	);if



;	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////	
;	(if (= "Лист маркировочный" str-tmp-0)
;		(progn
;			(if (= "Черный" str-tmp-3) (setq str-tmp-3 "черный"));if
;			
;			(setq nmbr-ln 3
;						str-tmp-1 (strcat str-tmp-0 " Phoenix Contact " str-tmp-1 ",")
;						str-tmp-2 (strcat "артикул " str-tmp-2 ", цвет " (strcase str-tmp-3 1) ", " (strcase str-tmp-4 1))
;			);setq
;		);progn
;	);if


	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////