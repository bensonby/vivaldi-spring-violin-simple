\version "2.18.2"

#(set-default-paper-size "a4" 'landscape)
#(set-global-staff-size 28)

violin = \relative c' {
  \key d \major
  \time 4/4
  \tempo 2 = 90
  \partial 4
  d4\mf
  fis8 r fis r fis4 e8 d a'2. a8 g fis r fis r fis4 e8 d a'2.
  a8 g fis4 g8 a g r fis r e2.

  d4\mp \break
  fis8 r fis r fis4 e8 d a'2. a8 g fis r fis r fis4 e8 d a'2.
  a8 g fis4 g8 a g r fis r e2.

  d4\mf \break
  a'4 g8 fis g4 a b a2 d,4 a' g8 fis g4 a b a2
  \tag #'include { d,4 b' a2 }
  g4 fis e8 d e4 e d2.

  d4\mp \break
  a'4 g8 fis g4 a b a2 d,4 a' g8 fis g4 a b a2
  \tag #'include { d,4 b' a2 }
  g4 fis e8 d e4 e d2.

  \bar "|."
  \break
}

violin-using-repeats = \relative c' {
  \key d \major
  \time 4/4
  \tempo 2 = 90
  \partial 4

  d4
  \repeat volta 2 {
    fis8 r fis r fis4 e8 d a'2. a8 g fis r fis r fis4 e8 d a'2.
    a8 g fis4 g8 a g r fis r e2. d4
  }
  \break

  \repeat volta 2 {
    a'4 g8 fis g4 a b a2 d,4 a' g8 fis g4 a b a2
    \tag #'include { d,4 b' a2 }
    g4 fis e8 d e4 e
  }
  \alternative {
    { d2. d4 }
    { d2. r4 }
  }
  \bar "|."
  \break

}

violin-using-repeats-more-lines = \relative c' {
  \key d \major
  \time 4/4
  \tempo 2 = 90
  \partial 4

  d4
  \repeat volta 2 {
    fis8 r fis r fis4 e8 d a'2. a8 g fis r fis r fis4 e8 d \break a'2.
    a8 g fis4 g8 a g r fis r e2. d4
  }
  \break

  \repeat volta 2 {
    a'4 g8 fis g4 a b a2 d,4 a' g8 fis g4 a
    \tag #'include { b4 a2 d,4}
    \break
    b'4 a2 g4 fis e8 d e4 e
  }
  \alternative {
    { d2. d4 }
    { d2. r4 }
  }
  \bar "|."
  \break

}

\paper {
  system-system-spacing = #'((basic-distance . 20) (padding . 1))
}

\bookpart {
  \header {
    title = "Violin Concerto in E major (Spring) 1st movt"
    subtitle = "Introduction for easy violin, in D major"
    subsubtitle = "Expanded, including missing notes, with letter note heads"
    composer = "Vivaldi"
  }

  \score {
    << \new Staff \with {
      fontSize = #+4
      \override StaffSymbol.staff-space = #(magstep +4)
    } {
    \keepWithTag #'include {
      \easyHeadsOn
      \violin-using-repeats-more-lines
    }
    } >>
    \layout {
      indent = 0.0
    }
  }
}
\bookpart {
  \header {
    title = "Violin Concerto in E major, RV 269 (Spring) 1st movt"
    subtitle = "Introduction for easy violin, in D major"
    subsubtitle = "Expanded, including missing notes"
    composer = "Vivaldi"
  }

  \score {
    \keepWithTag #'include \violin
    \layout {
      indent = 0.0
    }
  }
}
\bookpart {
  \header {
    title = "Violin Concerto in E major, RV 269 (Spring) 1st movt"
    subtitle = "Introduction for easy violin, in D major"
    subsubtitle = "Expanded, exluding missing notes"
    composer = "Vivaldi"
  }
  \score {
    \removeWithTag #'include \violin
    \layout {
      indent = 0.0
    }
  }
}
\bookpart {
  \header {
    title = "Violin Concerto in E major, RV 269 (Spring) 1st movt"
    subtitle = "Introduction for easy violin, in D major"
    subsubtitle = "Using repeats, including missing notes"
    composer = "Vivaldi"
  }
  \score {
    \keepWithTag #'include \violin-using-repeats
    \layout {
      indent = 0.0
    }
  }
}
\bookpart {
  \header {
    title = "Vivaldi - Violin Concerto in E major, RV 269 (Spring) 1st movt"
    subtitle = "Introduction for easy violin, in D major"
    subsubtitle = "Using repeats, excluding missing notes"
    composer = "Vivaldi"
  }
  \score {
    \removeWithTag #'include \violin-using-repeats
    \layout {
      indent = 0.0
    }
  }
}
