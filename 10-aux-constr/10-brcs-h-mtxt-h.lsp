;;; разработчик nado_vit@mail.ru

;///////////////////////////// рисование скобок, направление острия вверх, многострочный текст //////////////////////////////////////
(defun c:10-brcs-h-mtxt-h

( / adoc align-txt arc_l arc_l_c arc_l_end_angl arc_l_start_angl arc_mdl_1 arc_mdl_1_c arc_mdl_1_end_angl arc_mdl_1_start_angl 
arc_mdl_2 arc_mdl_2_c arc_mdl_2_end_angl arc_mdl_2_start_angl arc_r arc_r_c arc_r_end_angl arc_r_start_angl dist_x dist_x_half 
lin_1_pnt_1 lin_1_pnt_2 lin_2_pnt_1 lin_2_pnt_2 line_1 line_2 pi pnt_drct pnt_l pnt_r rad_arc ss1 txt_angl txt_pnt txt-1 xpnt_1 
xpnt_2 xpnt_l xpnt_r xpnt_tmp ypnt_drct ypnt_l)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(setvar "textstyle" "standard")

(setq	rad_arc 1 ;радиус закруглений
			dist_x 3
			pi 3.1415926535
);setq

;;;;;;;расстояние между точками должно быть больше или равно 4мм
(while (< (abs dist_x) 4) 
	(progn
		(setq	pnt_l (getpoint "\nУкажите левую точку\n")
					pnt_r (getpoint "\nУкажите правую точку\n")
					xpnt_l (nth 0 pnt_l)
					xpnt_r (nth 0 pnt_r)
					dist_x (- xpnt_r xpnt_l)
		);setq
		
		(if (< (abs dist_x) 4)
			(alert "\nРасстояние меньше 4мм.\nПовторите ввод.\n")
		);if
	);progn
);while


;;;;;;;меняем координаты y точек вставки между собой если точки указаны справа налево
(if (< dist_x 0) 
	(setq xpnt_tmp xpnt_l
				xpnt_l xpnt_r
	      xpnt_r xpnt_tmp
	      ypnt_l (nth 1 pnt_r)
	);setq
);if


(setq dist_x (- xpnt_r xpnt_l)
			dist_x_half (* dist_x 0.5)
			
			pnt_drct (getpoint "\nУкажите направление скобок\n")
			ypnt_drct (nth 1 pnt_drct)
			
			ypnt_l (nth 1 pnt_l)
);setq


;;;;;;;расчет базовых точек
(setq xpnt_1 (- (+ xpnt_l dist_x_half) rad_arc)
			xpnt_2 (+ xpnt_1 rad_arc)
			
			txt_angl 0
			
			arc_l_c (list xpnt_l ypnt_l) ;центр левой дуги
			arc_r_c (list xpnt_r ypnt_l) ;центр правой дуги
);setq


;направление скобок вверх, носик вниз
(if (> ypnt_l ypnt_drct) 
	(progn 									
		(setq	arc_l_start_angl pi
					arc_l_end_angl (* pi 1.5)
					
					arc_mdl_1_c (list (- (+ xpnt_l dist_x_half) rad_arc) (- ypnt_l (* rad_arc 2))) ;дуга 1 в середине
					arc_mdl_1_start_angl 0					
					arc_mdl_1_end_angl (* pi 0.5)
										
					lin_1_pnt_1 (list xpnt_l (- ypnt_l rad_arc))
					lin_1_pnt_2 (list (- (+ xpnt_l dist_x_half) rad_arc) (- ypnt_l rad_arc))
											
					arc_mdl_2_c (list (+ (+ xpnt_l dist_x_half) rad_arc) (- ypnt_l (* rad_arc 2))) ;дуга 2 в середине
					arc_mdl_2_start_angl (* pi 0.5)					
					arc_mdl_2_end_angl pi
					
					
					lin_2_pnt_1 (list (+ (+ xpnt_l dist_x_half) rad_arc) (- ypnt_l rad_arc))					
					lin_2_pnt_2 (list (+ xpnt_l (* 2 dist_x_half)) (- ypnt_l rad_arc))
									
					arc_r_start_angl (* pi 1.5)
					arc_r_end_angl 0
					
					txt_pnt (list (+ xpnt_l dist_x_half) (- ypnt_l (* rad_arc 2)))
					
					align-txt 2
		);setq
	);progn
);if


;направление скобок вниз, носик вверх
(if (< ypnt_l ypnt_drct) 
	(progn 									
		(setq	arc_l_start_angl (* pi 0.5)
					arc_l_end_angl pi
					
					arc_mdl_1_c (list (- (+ xpnt_l dist_x_half) rad_arc) (+ ypnt_l (* rad_arc 2))) ;дуга 1 в середине
					arc_mdl_1_start_angl (* pi 1.5)					
					arc_mdl_1_end_angl 0
										
					lin_1_pnt_1 (list xpnt_l (+ ypnt_l rad_arc))
					lin_1_pnt_2 (list (- (+ xpnt_l dist_x_half) rad_arc) (+ ypnt_l rad_arc))
											
					arc_mdl_2_c (list (+ (+ xpnt_l dist_x_half) rad_arc) (+ ypnt_l (* rad_arc 2))) ;дуга 2 в середине
					arc_mdl_2_start_angl pi					
					arc_mdl_2_end_angl (* pi 1.5)
					
					
					lin_2_pnt_1 (list (+ (+ xpnt_l dist_x_half) rad_arc) (+ ypnt_l rad_arc))					
					lin_2_pnt_2 (list (+ xpnt_l (* 2 dist_x_half)) (+ ypnt_l rad_arc))
									
					arc_r_start_angl 0
					arc_r_end_angl (* pi 0.5)
					
					txt_pnt (list (+ xpnt_l dist_x_half) (+ ypnt_l (* rad_arc 2)))
					
					align-txt 8
		);setq
	);progn
);if

(setvar "osmode" 0)

(setq arc_l
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 arc_l_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 arc_l_start_angl)
    	(cons 51 arc_l_end_angl)
  	);list
	);entmake
);setq

(setq arc_r
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 arc_r_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 arc_r_start_angl)
    	(cons 51 arc_r_end_angl)
  	);list
	);entmake
);setq


(setq arc_mdl_1
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 arc_mdl_1_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 arc_mdl_1_start_angl)
    	(cons 51 arc_mdl_1_end_angl)
  	);list
	);entmake
);setq


(setq arc_mdl_2
	(entmakex
  	(list
    	'(0 . "ARC")
    	'(100 . "AcDbCircle")
    	(cons 10 arc_mdl_2_c)
    	(cons 40 rad_arc)
    	'(100 . "AcDbArc")
    	(cons 50 arc_mdl_2_start_angl)
    	(cons 51 arc_mdl_2_end_angl)
  	);list
	);entmake
);setq


(setq txt-1
  (entmakex
		(list
			'(0 . "MTEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbMText")
			(cons 10 txt_pnt) ; нач точка текста
			(cons 1 "См. лист ****") ; содержание текста
			'(40 . 2.5) ; высота текста
			(cons 41 dist_x) ; растяжение текста
			(cons 42 dist_x) ; ширина текста
			(cons 50 0) ; поворот текста
			(cons 71 align-txt) ; выравнивание текста
			'(370 . -1) ; толщина текста
			(cons 7 (getvar "textstyle")) ; стиль текста
		);list
  );entmakex
);setq

(command "_line" lin_1_pnt_1 lin_1_pnt_2 "")

(setq line_1 (entlast))

(command "_line" lin_2_pnt_1 lin_2_pnt_2 "")

(setq line_2 (entlast))

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(setq	ss1 (ssadd)
			ss1 (ssadd arc_l ss1)
			ss1 (ssadd arc_mdl_1 ss1)
			ss1 (ssadd arc_mdl_2 ss1)
			ss1 (ssadd arc_r ss1)
			
			ss1 (ssadd line_1 ss1)
			ss1 (ssadd line_2 ss1)
);setq

(command "_pedit" "_M" ss1 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)

(vla-endundomark adoc)

(setvar "osmode" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////////////