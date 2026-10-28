;;; разработчик nado_vit@mail.ru
;///////////////////////////// рисование скобок вертикально, многострочный текст, выбор направления //////////////////////////////////////
(defun c:10-brcs-v-mtxt-v 

( / adoc arc_dwn arc_mdl_1 arc_mdl_2 arc_top dist_y dist_y_half dwn_arc_c dwn_arc_end_angl dwn_arc_start_angl lin_1_pnt_1 lin_1_pnt_2 
lin_2_pnt_1 lin_2_pnt_2 line_1 line_2 mdl_arc_1_c mdl_arc_1_end_angl mdl_arc_1_start_angl mdl_arc_2_c mdl_arc_2_end_angl 
mdl_arc_2_start_angl pi pnt_drct pnt_dwn pnt_up rad_arc ss1 top_arc_c top_arc_end_angl top_arc_start_angl txt_align txt_angl txt_pnt 
txt-1 xpnt_drct xpnt_up ypnt_1 ypnt_2 ypnt_dwn ypnt_tmp ypnt_up)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(setvar "textstyle" "standard")

(setq	rad_arc 1 ;радиус закруглений
			dist_y 3
			pi 3.1415926535
);setq

;;;;;;;расстояние между точками должно быть больше или равно 4мм
(while (< (abs dist_y) 4) 
	(progn
		(setq	pnt_up (getpoint "\nУкажите верхнюю точку\n")
					pnt_dwn (getpoint "\nУкажите нижнюю точку\n")
					ypnt_up (nth 1 pnt_up)
					ypnt_dwn (nth 1 pnt_dwn)
					dist_y (- ypnt_up ypnt_dwn)
		);setq
		
		(if (< (abs dist_y) 4)
			(alert "\nРасстояние меньше 4мм.\nПовторите ввод.\n")
		);if
	);progn
);while

;;;;;;;меняем координаты x точек вставки между собой если точки указаны снизу вверх
(if (< dist_y 0) 
	(setq ypnt_tmp ypnt_up
				ypnt_up ypnt_dwn
	      ypnt_dwn ypnt_tmp
	);setq
);if

(setq dist_y (- ypnt_up ypnt_dwn)
			dist_y_half (* dist_y 0.5)
			
			pnt_drct (getpoint "\nУкажите направление скобок\n")
			xpnt_drct (nth 0 pnt_drct)
			
			xpnt_up (nth 0 pnt_up)
);setq

(setvar "osmode" 0)

;;;;;;;расчет базовых точек
(setq ypnt_1 (+ (- ypnt_up dist_y_half) rad_arc)
			ypnt_2 (- (- ypnt_1 rad_arc) rad_arc)
			
			top_arc_c (list xpnt_up ypnt_up) ;центр верхней дуги
			
			dwn_arc_c (list xpnt_up ypnt_dwn) ;центр нижней дуги
);setq

;;;;;;;расчет точек, если носик скобок направлен влево
;;;;;;;направление скобок вправо
(if (< xpnt_drct xpnt_up) ; расчет точек в зависисмости от направления
	(progn 									
		(setq top_arc_start_angl (* pi 0.5)
					top_arc_end_angl (* pi 1)
		
					lin_1_pnt_1 (list (- xpnt_up rad_arc) ypnt_up) ;начальная точка верхнего отрезка
					lin_1_pnt_2 (list (- xpnt_up rad_arc) ypnt_1)
		
					mdl_arc_1_c (list (- xpnt_up (* rad_arc 2)) ypnt_1) ;центр дуги 1 в середине
					mdl_arc_1_start_angl (* pi 1.5)
					mdl_arc_1_end_angl 0
					
					mdl_arc_2_c (list (- xpnt_up (* rad_arc 2)) ypnt_2) ;центр дуги 2 в середине
					mdl_arc_2_start_angl 0
					mdl_arc_2_end_angl (* pi 0.5)
					
					lin_2_pnt_1 (list (- xpnt_up rad_arc) ypnt_2) ;начальная точка yb;него отрезка
					lin_2_pnt_2 (list (- xpnt_up rad_arc) ypnt_dwn)
										
					dwn_arc_start_angl pi
					dwn_arc_end_angl (* pi 1.5)					
					
					txt_align 8
					txt_pnt (list (- xpnt_up (* 2 rad_arc)) (- ypnt_1 rad_arc))					
		);setq
	);progn
);if
	

;;;;;;;расчет точек, если носик скобок направлен вправо
;;;;;;;направление скобок влево
(if (> xpnt_drct xpnt_up) ; расчет точек в зависисмости от направления
	(progn 									
		(setq	top_arc_start_angl 0
					top_arc_end_angl (* pi 0.5)
		
					lin_1_pnt_1 (list (+ xpnt_up rad_arc) ypnt_up) ;начальная точка верхнего отрезка
					lin_1_pnt_2 (list (+ xpnt_up rad_arc) ypnt_1)
		
					mdl_arc_1_c (list (+ xpnt_up (* rad_arc 2)) ypnt_1) ;центр дуги 1 в середине
					mdl_arc_1_start_angl pi
					mdl_arc_1_end_angl (* pi 1.5)
					
					mdl_arc_2_c (list (+ xpnt_up (* rad_arc 2)) ypnt_2) ;центр дуги 2 в середине
					mdl_arc_2_start_angl (* pi 0.5)
					mdl_arc_2_end_angl pi
					
					lin_2_pnt_1 (list (+ xpnt_up rad_arc) ypnt_2) ;начальная точка нижнего отрезка
					lin_2_pnt_2 (list (+ xpnt_up rad_arc) ypnt_dwn)
					
					dwn_arc_start_angl (* pi 1.5)
					dwn_arc_end_angl 0					
					
					txt_align 2			
					txt_pnt (list (+ xpnt_up (* 2 rad_arc)) (- ypnt_1 rad_arc))					
		);setq
	);progn
);if


;;;;;;;отрисовка элементов
(setq arc_top
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 top_arc_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 top_arc_start_angl)
    	(cons 51 top_arc_end_angl)
  	);list
	);entmake
);setq

(setq arc_mdl_1
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 mdl_arc_1_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 mdl_arc_1_start_angl)
    	(cons 51 mdl_arc_1_end_angl)
  	);list
	);entmake
);setq

(setq arc_mdl_2
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 mdl_arc_2_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 mdl_arc_2_start_angl)
    	(cons 51 mdl_arc_2_end_angl)
  	);list
	);entmake
);setq

(setq arc_dwn
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 dwn_arc_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 dwn_arc_start_angl)
    	(cons 51 dwn_arc_end_angl)
  	);list
	);entmake
);setq

(command "_line" lin_1_pnt_1 lin_1_pnt_2 "")

(setq line_1 (entlast))

(command "_line" lin_2_pnt_1 lin_2_pnt_2 "")

(setq line_2 (entlast))

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(setq	ss1 (ssadd)
			ss1 (ssadd arc_top ss1)
			ss1 (ssadd arc_mdl_1 ss1)
			ss1 (ssadd arc_mdl_2 ss1)
			ss1 (ssadd arc_dwn ss1)
			
			ss1 (ssadd line_1 ss1)
			ss1 (ssadd line_2 ss1)
);setq

(command "_pedit" "_M" ss1 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)

(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
      (cons 10 txt_pnt) 
      '(1 . "См. лист *****") 
      '(8 . "0")
      '(40 . 2.5) 
      (cons 41 dist_y) 
      (cons 42 dist_y) 
      (cons 71 txt_align) 
      '(370 . -1)
      '(50 . 1.5708)
      (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq
		

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;////////////////////////// конец программы ////////////////////////////////////////////