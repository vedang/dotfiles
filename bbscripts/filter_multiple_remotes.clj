#!/usr/bin/env bb

(ns filter-multiple-remotes
  (:require [clojure.java.shell :refer [sh with-sh-dir]]
            [babashka.fs :as fs]
            [clojure.string :as cs]))

(filter (fn [d]
          (when (fs/exists? (str d "/.git"))
            (< 1 (count (with-sh-dir d
                          (cs/split (:out (sh "git" "remote")) #"\n"))))))
        (filter fs/directory?
                (cs/split (:out (sh "ls")) #"\n")))
