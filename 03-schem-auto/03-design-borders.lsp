;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// границы проектирования                                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-design-borders

( / angl-1 angl-2 line-1 pnt-1 pnt-2 pnt-drctn tmp-celtscale tmp-celtype xpnt-1 xpnt-2 xpnt-drctn x-tmp ypnt-1 ypnt-2 ypnt-drctn)

(command "_.undo" "_begin")
(setvar "osmode" 0)
(setvar "cmdecho" 0)

(if	(= (tblsearch "block" "граница-проектирования-стрелка") nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (setvar "osmode" 0)
    (command "_pline" '(0 0) "_w" 0 0 '(0 -2) "_w" 1.5 0 '(0 -3) "")
    (setq line-1 (entlast))
    (command "_block" "граница-проектирования-стрелка" '(0 0) line-1 "")
  ) ;progn
);if

(setvar "osmode" 6199)

(setq	pnt-1 (getpoint "\nУкажите точку 1\n")
      pnt-2 (getpoint "\nУкажите точку 2\n")
			pnt-drctn (getpoint "\nУкажите точку направления\n")
			xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)
			xpnt-2 (nth 0 pnt-2)
			ypnt-2 (nth 1 pnt-2)
			xpnt-drctn (nth 0 pnt-drctn)
			ypnt-drctn (nth 1 pnt-drctn)
			angl-1 (atoi (angtos (angle pnt-1 pnt-2)))
			x-tmp nil
);setq

;опеределяем угол поворота
(if (<= angl-1 45);горизонтально, слева направо
  (setq angl-2 0
  );setq
);if

(if (>= angl-1 315);горизонтально, слева направо
  (setq angl-2 0
  );setq
);if

(if (and (<= angl-1 135) (>= angl-1 45));вертикально, снизу вверх
  (setq angl-2 90
  );setq
);if

(if (and (<= angl-1 225) (>= angl-1 135));горизонтально, справа налево
  (setq angl-2 180
  );setq
);if

(if (and (<= angl-1 315) (>= angl-1 225));вертикально, сверху вниз
  (setq angl-2 270
  );setq
);if

;опеределяем направление стрелок, вертикально вниз, угол 0
(if (and (= angl-2 0)
         (> ypnt-1 ypnt-drctn));and
  (setq angl-1 0
  );setq
);if

;опеределяем направление стрелок, вертикально вверх, угол 0
(if (and (= angl-2 0)
         (< ypnt-1 ypnt-drctn));and
  (setq angl-1 180
        pnt-1 (list xpnt-2 ypnt-1)
        pnt-2 (list xpnt-1 ypnt-1)
  );setq
);if

;опеределяем направление стрелок, вертикально вниз, угол 180
(if (and (= angl-2 180)
         (> ypnt-1 ypnt-drctn));and
  (setq angl-1 0
        pnt-1 (list xpnt-2 ypnt-1)
        pnt-2 (list xpnt-1 ypnt-1)
  );setq
);if

;опеределяем направление стрелок, вертикально вверх, угол 180
(if (and (= angl-2 180)
         (< ypnt-1 ypnt-drctn));and
  (setq angl-1 180
        pnt-1 (list xpnt-1 ypnt-1)
        pnt-2 (list xpnt-2 ypnt-1)
  );setq
);if

;опеределяем направление стрелок, горизонтально влево, угол 90
(if (and (= angl-2 90)
         (< xpnt-1 xpnt-drctn));and
  (setq angl-1 90
        pnt-1 (list xpnt-1 ypnt-1)
        pnt-2 (list xpnt-1 ypnt-2)
  );setq
);if

;опеределяем направление стрелок, горизонтально вправо, угол 90
(if (and (= angl-2 90)
         (> xpnt-1 xpnt-drctn));and
  (setq angl-1 270
        pnt-1 (list xpnt-1 ypnt-2)
        pnt-2 (list xpnt-1 ypnt-1)
  );setq
);if

;опеределяем направление стрелок, горизонтально влево, угол 270
(if (and (= angl-2 270)
         (< xpnt-1 xpnt-drctn));and
  (setq angl-1 90
        pnt-1 (list xpnt-1 ypnt-2)
        pnt-2 (list xpnt-1 ypnt-1)
  );setq
);if

;опеределяем направление стрелок, горизонтально вправо, угол 270
(if (and (= angl-2 270)
         (> xpnt-1 xpnt-drctn));and
  (setq angl-1 270
        pnt-1 (list xpnt-1 ypnt-1)
        pnt-2 (list xpnt-1 ypnt-2)
  );setq
);if

(setvar "osmode" 0)

(command "_insert" "граница-проектирования-стрелка" "_x" 1 "_y" 1 "_z" 1 "_r" angl-1 pnt-1)
(command "_insert" "граница-проектирования-стрелка" "_x" 1 "_y" 1 "_z" 1 "_r" angl-1 pnt-2)

(setq tmp-celtype (getvar "celtype") ;получаем текущее значение типа линии
			tmp-celtscale (getvar "celtscale")  ;получаем текущее значение масштаба
);setq
(if (= (tblsearch "ltype" "ACAD_ISO02W100" t) nil)
  (command "_.linetype" "_l" "ACAD_ISO02W100" "acadiso.lin" "")
);if

(setvar "celtype" "ACAD_ISO02W100");новый тип линии
(setvar "celtscale" 0.4);новое значение масштаба
(command "_line" pnt-1 pnt-2 "")

(setvar "celtscale" tmp-celtscale);возвращаем настройки
(setvar "celtype" tmp-celtype)


(command "_.undo" "_end")
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////
