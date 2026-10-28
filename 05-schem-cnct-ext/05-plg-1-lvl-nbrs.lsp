;/////// ************************************************************ //////////////////////////////
;/////// рисование одно€русных клемм                                  //////////////////////////////
;/////// ************************************************************ //////////////////////////////

(defun c:05-plg-1-lvl-nbrs

( / adoc angl circle-1 current-celtscale current-celtype dcl-id direction line-1 line-11 line-12 
line-2 line-3 line-4 line-5 line-6 nm-prgr pnt-drct pnt-ins rectangle-1 start-num x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq start-num 1);setq

(setvar "cmdecho" 0)
(setvar "osmode" 0)
(setvar "textstyle" "standard")

(if (= (tblsearch "ltype" "acad_iso10w100") nil)
	(command "_linetype" "_l" "acad_iso10w100" "acadiso.lin" "")
);if

(if (= (tblsearch "block" "клемма-1-€рус-разборн-10-мм") nil) ; ищем блок
	(progn		
		(command "_rectangle" (list -5 0) (list +5 -5)) ;пр€моуголник
		(setq rectangle-1 (entlast))			
		(command "_circle" (list 0 -2.5) 0.5) ;центр кружка
		(setq circle-1 (entlast))			
		(command "_line" (list -1.5 -2.5) (list -0.5 -2.5) "")
		(setq line-1 (entlast))		
		(command "_line" (list +0.5 -2.5) (list 1.5 -2.5) "")
		(setq line-2 (entlast))		
		(command "_block" "клемма-1-€рус-разборн-10-мм" (list 0 0) rectangle-1 circle-1 line-1 line-2 "")
	);progn
);if

(if (= (tblsearch "block" "клемма-1-€рус-разъемн-10-мм") nil) ; ищем блок
	(progn
		(command "_rectangle" (list -5 0) (list 5 -5) (list 5 -5))
		(setq rectangle-1 (entlast))
		(command "_line" (list -1.5 -2.5) (list 0 -2.5) "")
		(setq line-1 (entlast))
		(command "_line" (list 1 -2.5) (list 1.5 -2.5) "")
		(setq line-2 (entlast))
		(command "_line" (list 0 -2.5) (polar (list 0 -2.5) (angtof "135" 0) 2) "")
		(setq line-3 (entlast))
		(command "_line" (list 0 -2.5) (polar (list 0 -2.5) (angtof "225" 0) 2) "")
		(setq line-4 (entlast))
		(command "_line" (list 1 -2.5) (polar (list 1 -2.5) (angtof "135" 0) 2) "")
		(setq line-5 (entlast))
		(command "_line" (list 1 -2.5) (polar (list 1 -2.5) (angtof "225" 0) 2) "")
		(setq line-6 (entlast))
		(command "_block" "клемма-1-€рус-разъемн-10-мм" (list 0 0) rectangle-1 line-1 line-2 line-3 line-4 line-5 line-6 "")
	) ;progn
);if

(if (= (tblsearch "block" "клемма-1-€рус-разрыв-10-мм") nil) ; ищем блок
	(progn
		(setq current-celtype (getvar "celtype")
					current-celtscale (getvar "celtscale")
		);setq
		
		(setvar "celtype" "acad_iso10w100")
		(setvar "celtscale" 0.1)
		(command "_line" (list -6 -2) (list 6 -2) "")
		(setq line-11 (entlast))
		(command "_line" (list -6 -3) (list 6 -3) "")
		(setq  line-12 (entlast))
		
		(setvar "celtype" current-celtype)
		(setvar "celtscale" current-celtscale)
		
		(command "_line" (list -5 -2) (list -5 0) "")
		(setq line-1 (entlast))
		(command "_line" (list -5 0) (list 5 0) "")
		(setq line-2 (entlast))
		(command "_line" (list 5 0) (list 5 -2) "")
		(setq line-3 (entlast))
		(command "_line" (list 5 -3) (list 5 -5) "")
		(setq line-4 (entlast))
		(command "_line" (list 5 -5) (list -5 -5) "")
		(setq line-5 (entlast))
		(command "_line" (list -5 -5) (list -5 -3) "")
		(setq line-6 (entlast))
		(command "_block" "клемма-1-€рус-разрыв-10-мм" (list 0 0) line-1 line-2 line-3 line-4 line-5 line-6 line-11 line-12 "")
	);progn
);if

(if (= (tblsearch "block" "клемма-1-€рус-разрыв-10-мм-пол") nil) ; ищем блок
	(progn
		(setq current-celtype (getvar "celtype")
					current-celtscale (getvar "celtscale")
		);setq
		
		(setvar "osmode" 0)
		(setvar "celtype" "acad_iso10w100")
		(setvar "celtscale" 0.1)
		(command "_line" (list -6 -2) (list 6 -2) "");штрихпунктирна€ верхн€€
		(setq line-11 (entlast))
		(setvar "celtype" current-celtype)
		(setvar "celtscale" current-celtscale)
		(command "_line" (list -5 -2) (list -5 0) "")
		(setq line-1 (entlast))
		(command "_line" (list -5 0) (list 5 0) "")
		(setq line-2 (entlast))
		(command "_line" (list 5 0) (list 5 -2) "")
		(setq line-3 (entlast))
		(command "_block" "клемма-1-€рус-разрыв-10-мм-пол" (list 0 0) line-1 line-2 line-3 line-11 "");command
	);progn
);if

(if (= (tblsearch "block" "клемма-1-€рус-разборн-5-мм") nil) ; ищем блок
	(progn			
		(command "_rectangle" (list -2.5 +2.5) (list +2.5 -2.5) (list +2.5 -2.5))
		(setq rectangle-1 (entlast))
			
		(command "_circle" (list 0 0) 0.5)
		(setq circle-1 (entlast))
			
		(command "_line" (list -1.5 0) (list -0.5 0) "")
		(setq line-1 (entlast))
			
		(command "_line" (list +0.5 0) (list 1.5 0) "")
		(setq line-2 (entlast))
			
		(command "_block" "клемма-1-€рус-разборн-5-мм" (list 0 2.5) rectangle-1 circle-1 line-1 line-2 "")
	);progn
);if

(if (= (tblsearch "block" "клемма-1-€рус-разъемн-5-мм") nil)
	(progn
		(setvar "osmode" 0)
		(command "_rectangle" (list -2.5 0) (list 2.5 -5) (list 5 -5))
		(setq rectangle-1 (entlast))
		(command "_line" (list -1.5 -2.5) (list 0 -2.5) "")
		(setq line-1 (entlast))
		(command "_line" (list 1 -2.5) (list 1.5 -2.5) "")
		(setq line-2 (entlast))
		(command "_line" (list 0 -2.5) (polar (list 0 -2.5) (angtof "135" 0) 2) "")
		(setq line-3 (entlast))
		(command "_line" (list 0 -2.5) (polar (list 0 -2.5) (angtof "225" 0) 2) "")
		(setq line-4 (entlast))
		(command "_line" (list 1 -2.5) (polar (list 1 -2.5) (angtof "135" 0) 2) "")
		(setq line-5 (entlast))
		(command "_line" (list 1 -2.5) (polar (list 1 -2.5) (angtof "225" 0) 2) "")
		(setq line-6 (entlast))
		(command "_block" "клемма-1-€рус-разъемн-5-мм" (list 0 0) rectangle-1 line-1 line-2 line-3 line-4 line-5 line-6 "")
	) ;progn
);if

(if (< (setq dcl-id (load_dialog "dia-05-plg-1-lvl-nbrs.dcl")) 0) ;ищем диалог
	(progn
		(alert "Ќе найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_05_plg_1_lvl" dcl-id))
	(exit)
);if

(action_tile "but11"
  (strcat "(setq nm-prgr \"but11\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but12"
  (strcat "(setq start-num (atoi (get_tile \"start-num\")))"
  				"(setq nm-prgr \"but12\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but13"
  (strcat "(setq nm-prgr \"but13\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but14"
  (strcat "(setq nm-prgr \"but14\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but15"
  (strcat "(setq start-num (atoi (get_tile \"start-num\")))"
  				"(setq nm-prgr \"but15\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but18"
  (strcat "(setq nm-prgr \"but18\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but19"
  (strcat "(setq nm-prgr \"but19\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but21"
  (strcat "(setq nm-prgr \"but21\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but22"
  (strcat "(setq start-num (atoi (get_tile \"start-num\")))"
  				"(setq nm-prgr \"but22\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but31"
  (strcat "(setq nm-prgr \"but31\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but32"
  (strcat "(setq start-num (atoi (get_tile \"start-num\")))"
  				"(setq nm-prgr \"but32\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but33"
  (strcat "(setq nm-prgr \"but33\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but34"
  (strcat "(setq nm-prgr \"but34\")"
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

(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\n”кажите точку вставки\n")
			pnt-drct (getpoint "\n”кажите направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct)));угол направлени€
			
			x-pnt-ins (nth 0 pnt-ins)
			y-pnt-ins (nth 1 pnt-ins)
);setq

(setvar "osmode" 0)

(cond
	((or (<= angl 45) (>= angl 315)) (setq direction "right"));вправо	
	((and (<= angl 225) (>= angl 135)) (setq direction "left"));влево	
	((and (<= angl 315) (>= angl 225)) (setq direction "down"));вниз	
	((and (<= angl 135) (>= angl 45)) (setq direction "up"));вверх
);cond

(cond 
	((= nm-prgr "but11") (but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction 5));’“ 10 мм
	
	((= nm-prgr "but12") (but12-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction)); леммы
	
	((= nm-prgr "but13") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-10-мм"));–азборный тип клеммы
	
	((= nm-prgr "but14") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разъемн-10-мм"))
	
	((= nm-prgr "but15") (but15-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction 5));’“ 10 мм + разборный тип + клеммы
	
	((= nm-prgr "but18") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разрыв-10-мм"))
	
	((= nm-prgr "but19") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разрыв-10-мм-пол"))
	
	((= nm-prgr "but21") (but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction 7.5));XT 15 мм
	
	((= nm-prgr "but22") (but15-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction 7.5));’“ 15 мм + разборный тип + клеммы
	
	((= nm-prgr "but31") (but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction 2.5));XT 5 мм
	
	((= nm-prgr "but32") (but32-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction));клеммы 5 мм
	
	((= nm-prgr "but33") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-5-мм"));клеммы 5 мм разборный тип
	
	((= nm-prgr "but34") (but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разъемн-5-мм"));клеммы 5 мм разъемный тип
);if

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// ************************************************************ //////////////////////////////
;/////// конец программы                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;/////// ************************************************************ //////////////////////////////
;/////// рисуем обозначение клеммного р€да шириной 10мм               //////////////////////////////

(defun but11-05-plg-1-lvl-nbrs

(x-pnt-ins y-pnt-ins direction half-w / angl-txt dlt-x dlt-y pnt-1 pnt-2 pnt-3 pnt-4 pnt-5 pnt-6 pnt-txt set-obj)

(cond
	((= direction "right") (setq dlt-x 5))
	((= direction "left") (setq dlt-x -5))
	((= direction "down") (setq dlt-y -5))
	((= direction "up") (setq dlt-y 5))
);if

(if (or (= direction "right") (= direction "left"));горизонтально
	(setq pnt-1 (list x-pnt-ins (- y-pnt-ins half-w))
				pnt-2 (list (+ x-pnt-ins dlt-x) (+ y-pnt-ins half-w))
				pnt-txt (list (+ x-pnt-ins (* dlt-x 0.5)) y-pnt-ins)
				angl-txt 90
	);setq
);if

(if (or (= direction "down") (= direction "up"));вертикально
	(setq pnt-1 (list (- x-pnt-ins half-w) y-pnt-ins);обозначение
				pnt-2 (list (+ x-pnt-ins half-w) (+ y-pnt-ins dlt-y))
				pnt-txt (list x-pnt-ins (+ y-pnt-ins (* dlt-y 0.5)))
				angl-txt 0
	);setq
);if

(setvar "osmode" 0)
(command "_RECTANGLE" pnt-1 pnt-2)
(command "_text" "_mc" pnt-txt 2.5 angl-txt "’“")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////// ************************************************************ //////////////////////////////
;///////                                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;;/////// ************************************************************ /////////////////////////////
;;/////// рисуем клеммы шириной 10 мм                                  /////////////////////////////
;/////// ************************************************************ //////////////////////////////

(defun but12-05-plg-1-lvl-nbrs

(start-num x-pnt-ins y-pnt-ins pnt-drct direction / dlt-num dlt-x dlt-y nmbr-plgs pnt-1 pnt-2 pnt-3 pnt-4 pnt-5 pnt-6 pnt-txt set-obj x-pnt-drct y-pnt-drct)

(setq x-pnt-drct (nth 0 pnt-drct)
			y-pnt-drct (nth 1 pnt-drct)
);setq

(cond
	((= direction "right");вправо
		(setq dlt-x 5
					nmbr-plgs (fix (/ (abs (- x-pnt-drct x-pnt-ins)) 5))
					dlt-num 1
		);setq
	);=
	
	((= direction "left");влево
		(setq dlt-x -5
					nmbr-plgs (fix (/ (abs (- x-pnt-drct x-pnt-ins)) 5))
					start-num nmbr-plgs
					dlt-num -1
		);setq
	);=

	((= direction "down");вниз
		(setq dlt-y -5
					nmbr-plgs (fix (/ (abs (- y-pnt-drct y-pnt-ins)) 5))
					dlt-num 1
		);setq
	);=
	
	((= direction "up");вверх
		(setq dlt-y 5
					nmbr-plgs (fix (/ (abs (- y-pnt-drct y-pnt-ins)) 5))
					start-num nmbr-plgs
					dlt-num -1
		);setq
	);=
);cond

(setvar "osmode" 0)

;;;;;;;/////// рисуем клеммы горизонтально
(if (or (= direction "right") (= direction "left"))
	(repeat nmbr-plgs
		(setq pnt-1 (list x-pnt-ins (- y-pnt-ins 5))
					pnt-2 (list (+ x-pnt-ins dlt-x) (+ y-pnt-ins 5))
					pnt-txt (list (+ x-pnt-ins (* dlt-x 0.5)) y-pnt-ins)
					
					pnt-3 (list (+ x-pnt-ins 3.5) (+ y-pnt-ins 6)) ;сущ пр€моугольник
				  pnt-4 (list (+ x-pnt-ins 1.5) (+ y-pnt-ins 4))
				
				  pnt-5 (list (+ x-pnt-ins 3.5) (+ y-pnt-ins 1)) ;сущ текст
				  pnt-6 (list (+ x-pnt-ins 1.5) (- y-pnt-ins 1))						
		);setq

		(setq set-obj (ssget "_C" pnt-3 pnt-4 '((0 . "LWPOLYLINE"))));setq

    (if (= set-obj nil)
      (command "_RECTANGLE" pnt-1 pnt-2)
    );if

    (setq set-obj nil
          set-obj (ssget "_C" pnt-5 pnt-6 '((0 . "*TEXT")))
    );setq

    (if (/= set-obj nil)  
      (command "_erase" set-obj "")
    );if
    
    (command "_text" "_mc" pnt-txt 2.5 90 start-num)
			
		(setq start-num (+ start-num dlt-num)
					x-pnt-ins (+ x-pnt-ins dlt-x)				
		);setq
	);repeat
);if


;;;;;;;/////// рисуем вертикально
(if (or (= direction "down") (= direction "up"))
	(repeat nmbr-plgs
		(setq pnt-1 (list (- x-pnt-ins 5) y-pnt-ins)
					pnt-2 (list (+ x-pnt-ins 5) (+ y-pnt-ins dlt-y))
					pnt-txt (list x-pnt-ins (+ y-pnt-ins (* dlt-y 0.5)))
					
					pnt-3 (list (+ x-pnt-ins 6) (- y-pnt-ins 1.5)) ;сущ пр€моугольник
				  pnt-4 (list (+ x-pnt-ins 4) (- y-pnt-ins 3.5))
				
				  pnt-5 (list (+ x-pnt-ins 1) (- y-pnt-ins 1.5)) ;сущ текст
				  pnt-6 (list (- x-pnt-ins 1) (- y-pnt-ins 3.5))			
		);setq
		
		(setq set-obj (ssget "_C" pnt-3 pnt-4 '((0 . "LWPOLYLINE"))));setq

    (if (= set-obj nil)
      (command "_RECTANGLE" pnt-1 pnt-2)
    );if

    (setq set-obj nil
          set-obj (ssget "_C" pnt-5 pnt-6 '((0 . "*TEXT")))
    );setq

    (if (/= set-obj nil)  
      (command "_erase" set-obj "")
    );if
    
    (command "_text" "_mc" pnt-txt 2.5 0 start-num)
			
		(setq start-num (+ start-num dlt-num)
					y-pnt-ins (+ y-pnt-ins dlt-y)				
		);setq
	);repeat
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;/////// ************************************************************ //////////////////////////////
;/////// рисование типа соединени€ клемм, разрыв клемм,               //////////////////////////////
;/////// ширина не важно                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////
(defun but13-05-plg-1-lvl-nbrs

(x-pnt-ins y-pnt-ins direction name-block / angl-block pnt-1 x-pnt-1 y-pnt-1)

(setq pnt-1 (list x-pnt-ins y-pnt-ins));setq

(cond
	((= direction "right");вправо
		(setq angl-block 90);setq
	);=
	
	((= direction "left");влево
		(setq angl-block 90
					x-pnt-1 (- x-pnt-ins 5)
					pnt-1 (list x-pnt-1 y-pnt-ins)
		);setq
	);=

	((= direction "down");вниз
		(setq angl-block 0);setq
	);=
	
	((= direction "up");вверх
		(setq angl-block 0
					y-pnt-1 (+ y-pnt-ins 5)
					pnt-1 (list x-pnt-ins y-pnt-1)
		);setq
	);=
);cond

(setvar "osmode" 0)

(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-block pnt-1)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////// ************************************************************ //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;/////// ************************************************************ //////////////////////////////
;/////// обозначение разной ширины + разборный тип + клеммы 10 мм     //////////////////////////////
;/////// ************************************************************ //////////////////////////////
(defun but15-05-plg-1-lvl-nbrs

(start-num x-pnt-ins y-pnt-ins pnt-drct direction half-w / nmbr-plgs x-pnt-drct y-pnt-drct)

;;;;;;;///////////////////////////////////////////////////////////////////////////////////
(if (= direction "right");вправо
	(progn
		(but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction half-w)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq x-pnt-ins (+ x-pnt-ins 5));setq
		
		(but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-10-мм")
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq x-pnt-ins (+ x-pnt-ins 5));setq
		
		(but12-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
	);progn
);if


;;;;;;;///////////////////////////////////////////////////////////////////////////////////
(if (= direction "left");влево
	(progn
		(but12-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq x-pnt-drct (nth 0 pnt-drct)
					nmbr-plgs (fix (/ (abs (- x-pnt-drct x-pnt-ins)) 5))
					x-pnt-ins (- x-pnt-ins (* nmbr-plgs 5))
		);setq
		
		(but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-10-мм")
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq x-pnt-ins (+ x-pnt-ins -5));setq
		
		(but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction half-w)

		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
	);progn
);if


;;;;;;;///////////////////////////////////////////////////////////////////////////////////
(if (= direction "down");вниз
	(progn
		(but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction half-w)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq y-pnt-ins (+ y-pnt-ins -5));setq
		
		(but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-10-мм")
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq y-pnt-ins (+ y-pnt-ins -5));setq
		
		(but12-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
	);progn
);if


;;;;;;;///////////////////////////////////////////////////////////////////////////////////
(if (= direction "up");вверх
	(progn
		(but12-05-plg-1-lvl-nbrs start-num x-pnt-ins y-pnt-ins pnt-drct direction)
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq y-pnt-drct (nth 1 pnt-drct)
					nmbr-plgs (fix (/ (abs (- y-pnt-drct y-pnt-ins)) 5))
					y-pnt-ins (+ y-pnt-ins (* nmbr-plgs 5))
		);setq
				
		(but13-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction "клемма-1-€рус-разборн-10-мм")
		
		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
		
		(setq y-pnt-ins (+ y-pnt-ins 5));setq
		
		(but11-05-plg-1-lvl-nbrs x-pnt-ins y-pnt-ins direction half-w)

		(setvar "osmode" 0)
		(setvar "cmdecho" 0)
	);progn
);if


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;/////// ************************************************************ //////////////////////////////
;;/////// рисуем клеммы шириной 5 мм                                   /////////////////////////////

(defun but32-05-plg-1-lvl-nbrs

(start-num x-pnt-ins y-pnt-ins pnt-drct direction / dlt-num dlt-x dlt-y nmbr-plgs pnt-1 pnt-2 
pnt-txt x-pnt-drct y-pnt-drct)

(setvar "osmode" 0)

(setq x-pnt-drct (nth 0 pnt-drct)
			y-pnt-drct (nth 1 pnt-drct)
);setq

(cond
	((= direction "right");вправо
		(setq dlt-x 5
					nmbr-plgs (fix (/ (abs (- x-pnt-drct x-pnt-ins)) 5))
					dlt-num 1
		);setq
	);=
	
	((= direction "left");влево
		(setq dlt-x -5
					nmbr-plgs (fix (/ (abs (- x-pnt-drct x-pnt-ins)) 5))
					start-num nmbr-plgs
					dlt-num -1
		);setq
	);=

	((= direction "down");вниз
		(setq dlt-y -5
					nmbr-plgs (fix (/ (abs (- y-pnt-drct y-pnt-ins)) 5))
					dlt-num 1
		);setq
	);=
	
	((= direction "up");вверх
		(setq dlt-y 5
					nmbr-plgs (fix (/ (abs (- y-pnt-drct y-pnt-ins)) 5))
					start-num nmbr-plgs
					dlt-num -1
		);setq
	);=
);cond

(setvar "osmode" 0)

;;;;;;;/////// рисуем клеммы горизонтально
(if (or (= direction "right") (= direction "left"))
	(repeat nmbr-plgs
		(setq pnt-1 (list x-pnt-ins (- y-pnt-ins 2.5))
					pnt-2 (list (+ x-pnt-ins dlt-x) (+ y-pnt-ins 2.5))
					pnt-txt (list (+ x-pnt-ins (* dlt-x 0.5)) y-pnt-ins)				
		);setq
				
		(command "_RECTANGLE" pnt-1 pnt-2)
		(command "_text" "_mc" pnt-txt 2.5 90 start-num)
			
		(setq start-num (+ start-num dlt-num)
					x-pnt-ins (+ x-pnt-ins dlt-x)				
		);setq
	);repeat
);if


;;;;;;;/////// рисуем вертикально
(if (or (= direction "down") (= direction "up"))
	(repeat nmbr-plgs
		(setq pnt-1 (list (- x-pnt-ins 2.5) y-pnt-ins)
					pnt-2 (list (+ x-pnt-ins 2.5) (+ y-pnt-ins dlt-y))
					pnt-txt (list x-pnt-ins (+ y-pnt-ins (* dlt-y 0.5)))				
		);setq
				
		(command "_RECTANGLE" pnt-1 pnt-2)
		(command "_text" "_mc" pnt-txt 2.5 0 start-num)
			
		(setq start-num (+ start-num dlt-num)
					y-pnt-ins (+ y-pnt-ins dlt-y)				
		);setq
	);repeat
);if
	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////// ************************************************************ //////////////////////////////
;/////// ************************************************************ //////////////////////////////

