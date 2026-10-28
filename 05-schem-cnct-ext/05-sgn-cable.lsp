;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// рисование знака кабеля на ссвп                               ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////

(defun c:05-sgn-cable

( / adoc arc-1 arc-2 dcl-id line-1 line-2 line-3 type-list)
   
(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(if (< (setq dcl-id (load_dialog "dia-05-sgn-cable.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_05_sgn_cable" dcl-id))
	(exit)
);if

;;;;;;;; знак 15 мм
(action_tile "but-11"
  (strcat "(setq type-list \"but-11\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-12"
  (strcat "(setq type-list \"but-12\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-13"
  (strcat "(setq type-list \"but-13\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-14"
  (strcat "(setq type-list \"but-14\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-15"
  (strcat "(setq type-list \"but-15\")"
  				"(done_dialog)"
  );strcat
);action_tile


;;;;;;;; знак 20 мм
(action_tile "but-21"
  (strcat "(setq type-list \"but-21\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-22"
  (strcat "(setq type-list \"but-22\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-23"
  (strcat "(setq type-list \"but-23\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-24"
  (strcat "(setq type-list \"but-24\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-25"
  (strcat "(setq type-list \"but-25\")"
  				"(done_dialog)"
  );strcat
);action_tile

;;;;;;;; знак 30 мм
(action_tile "but-31"
  (strcat "(setq type-list \"but-31\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-32"
  (strcat "(setq type-list \"but-32\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-33"
  (strcat "(setq type-list \"but-33\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-34"
  (strcat "(setq type-list \"but-34\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-35"
  (strcat "(setq type-list \"but-35\")"
  				"(done_dialog)"
  );strcat
);action_tile

;;;;;;;; знак 12 мм
(action_tile "but-41"
  (strcat "(setq type-list \"but-41\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-42"
  (strcat "(setq type-list \"but-42\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-43"
  (strcat "(setq type-list \"but-43\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-44"
  (strcat "(setq type-list \"but-44\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-45"
  (strcat "(setq type-list \"but-45\")"
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

(setvar "osmode" 0)

;;;;;;; блок знак кабеля 15 мм
(if (= (tblsearch "block" "ссвп-обозн-каб-15мм") nil)
	(progn
		(setvar "osmode" 0)
		(command "_line" '(0 0) '(0 -3) "")
		(setq line-1 (entlast))
		(command "_arc" '(-3 -6) '(0 -3) '(3 -6) "")
		(setq arc-1 (entlast))
		(command "_line" '(3 -6) '(3 -15) "")
		(setq line-2 (entlast))
		(command "_line" '(-3 -6) '(-3 -15) "")
		(setq line-3 (entlast))
		(command "_arc" '(3 -15) '(0 -18) '(-3 -15) "")
		(setq arc-2 (entlast))
		(command "_block" "ссвп-обозн-каб-15мм" '(0 0) line-1 line-2 line-3 arc-1 arc-2 "")
	);progn
);if


;;;;;;; блок знак кабеля 20 мм
(if (= (tblsearch "block" "ссвп-обозн-каб-20мм") nil)
	(progn
		(setvar "osmode" 0)
		(command "_line" '(0 0) '(0 -3) "")
		(setq line-1 (entlast))
		(command "_arc" '(-3 -6) '(0 -3) '(3 -6) "")
		(setq arc-1 (entlast))
		(command "_line" '(3 -6) '(3 -20) "")
		(setq line-2 (entlast))
		(command "_line" '(-3 -6) '(-3 -20) "")
		(setq line-3 (entlast))
		(command "_arc" '(3 -20) '(0 -23) '(-3 -20) "")
		(setq arc-2 (entlast))
		(command "_block" "ссвп-обозн-каб-20мм" '(0 0) line-1 line-2 line-3 arc-1 arc-2 "")
	);progn
);if


;;;;;;; блок знак кабеля 30 мм
(if (= (tblsearch "block" "ссвп-обозн-каб-30мм") nil) ; создаем блок 
	(progn
		(setvar "osmode" 0)
		(command "_line" '(0 0) '(0 -3) "")
		(setq line-1 (entlast))
		(command "_arc" '(-3 -6) '(0 -3) '(3 -6) "")
		(setq arc-1 (entlast))
		(command "_line" '(3 -6) '(3 -30) "")
		(setq line-2 (entlast))
		(command "_line" '(-3 -6) '(-3 -30) "")
		(setq line-3 (entlast))
		(command "_arc" '(3 -30) '(0 -33) '(-3 -30) "")
		(setq arc-2 (entlast))
		(command "_block" "ссвп-обозн-каб-30мм" '(0 0)
			line-1 line-2 line-3 arc-1 arc-2 "") ; создаем блок
		);progn
);if

;;;;;;; блок знак кабеля 12 мм
(if (= (tblsearch "block" "ссвп-обозн-каб-12мм") nil)
	(progn
		(setvar "osmode" 0)
		(command "_line" '(0 0) '(0 -3) "")
		(setq line-1 (entlast))
		(command "_arc" '(-3 -6) '(0 -3) '(3 -6) "")
		(setq arc-1 (entlast))
		(command "_line" '(3 -6) '(3 -12) "")
		(setq line-2 (entlast))
		(command "_line" '(-3 -6) '(-3 -12) "")
		(setq line-3 (entlast))
		(command "_arc" '(3 -12) '(0 -15) '(-3 -12) "")
		(setq arc-2 (entlast))
		(command "_block" "ссвп-обозн-каб-12мм" '(0 0) line-1 line-2 line-3 arc-1 arc-2 "")
	);progn
);if


(setvar "osmode" 6199)

(cond
	((= type-list "but-11") (05-sgn-cable-01 "***" 10.5 "ссвп-обозн-каб-15мм"));=
	((= type-list "but-12") (05-sgn-cable-01 "-А" 10.5 "ссвп-обозн-каб-15мм"));=
	((= type-list "but-13") (05-sgn-cable-01 "-С" 10.5 "ссвп-обозн-каб-15мм"));=
	((= type-list "but-14") (05-sgn-cable-01 "-Д" 10.5 "ссвп-обозн-каб-15мм"));=

	((= type-list "but-21") (05-sgn-cable-01 "***" 13 "ссвп-обозн-каб-20мм"));=
	((= type-list "but-22") (05-sgn-cable-01 "-А" 13 "ссвп-обозн-каб-20мм"));=
	((= type-list "but-23") (05-sgn-cable-01 "-С" 13 "ссвп-обозн-каб-20мм"));=
	((= type-list "but-24") (05-sgn-cable-01 "-Д" 13 "ссвп-обозн-каб-20мм"));=

	((= type-list "but-31") (05-sgn-cable-01 "***" 18 "ссвп-обозн-каб-30мм"));=
	((= type-list "but-32") (05-sgn-cable-01 "-А" 18 "ссвп-обозн-каб-30мм"));=
	((= type-list "but-33") (05-sgn-cable-01 "-С" 18 "ссвп-обозн-каб-30мм"));=
	((= type-list "but-34") (05-sgn-cable-01 "-Д" 18 "ссвп-обозн-каб-30мм"));=
	
	((= type-list "but-41") (05-sgn-cable-01 "***" 9 "ссвп-обозн-каб-12мм"));=
	((= type-list "but-42") (05-sgn-cable-01 "-А" 9 "ссвп-обозн-каб-12мм"));=
	((= type-list "but-43") (05-sgn-cable-01 "-С" 9 "ссвп-обозн-каб-12мм"));=
	((= type-list "but-44") (05-sgn-cable-01 "-Д" 9 "ссвп-обозн-каб-12мм"));=
);cond


(cond
	((= type-list "but-45") (05-sgn-cable-02 9 "ссвп-обозн-каб-12мм"));=
	((= type-list "but-15") (05-sgn-cable-02 10.5 "ссвп-обозн-каб-15мм"));=
	((= type-list "but-25") (05-sgn-cable-02 13 "ссвп-обозн-каб-20мм"));=
	((= type-list "but-35") (05-sgn-cable-02 18 "ссвп-обозн-каб-30мм"));=
);cond


(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////


;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// рисование знака кабеля указанной длины, знак вертикально     ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun 05-sgn-cable-01

(txt-type delta-y name-block / pnt-ins pnt-txt)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "Укажите точку")) nil)
	(setq pnt-txt (list (nth 0 pnt-ins) (- (nth 1 pnt-ins) delta-y)));setq
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
	(command "_text" "_mc" pnt-txt 2.5 90 txt-type)
	(setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////


;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// рисование знака кабеля указанной длины, выбор направления    ////////////////////////////////////////////////////////////
;/////// знака                                                        ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun 05-sgn-cable-02

(delta-dist name-block / angl angl-blck angl-txt pnt-drct pnt-ins pnt-ins-txt x-pnt-ins y-pnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
			x-pnt-ins (nth 0 pnt-ins)
			y-pnt-ins (nth 1 pnt-ins)
			pnt-drct (getpoint "\nУкажите направление знака\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

(setvar "osmode" 0)

(if (and (<= angl 135) (>= angl 45));знак вверх
	(setq pnt-ins-txt (list (- x-pnt-ins 0) (+ y-pnt-ins delta-dist))
				angl-txt 90												 
	      angl-blck 180
	);setq
);if
		
(if (and (<= angl 225) (>= angl 135));знак влево
	(setq pnt-ins-txt (list (- x-pnt-ins delta-dist) (+ y-pnt-ins 0))
				angl-txt 0												 
	      angl-blck 270																			
	);setq
);if

(if (or (<= angl 45) (>= angl 315));знак вправо
	(setq pnt-ins-txt (list (+ x-pnt-ins delta-dist) (+ y-pnt-ins 0))
				angl-txt 0												 
	      angl-blck 90																			
	);setq
);if

(if (and (>= angl 225) (<= angl 315));знак вниз
	(setq pnt-ins-txt (list x-pnt-ins (- y-pnt-ins delta-dist))
				angl-txt 90												 
	      angl-blck 0																			
  );setq
);if

(command "_text" "_mc" pnt-ins-txt 2.5 angl-txt "-***" "")
(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////
