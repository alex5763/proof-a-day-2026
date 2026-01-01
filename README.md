# Proof a Day 2026

A year-long personal project to write one mathematical proof per day!

---

## Motivation

The goal of this project is to improve mathematical reasoning, proof writing,
and long-term retention by engaging in daily, structured proof construction.
All proofs are written in LaTeX and version-controlled to form a permanent,
searchable record of work.

This repository is intended as a mathematical working notebook rather than
a demonstration of novelty or productivity.

---

## What Counts as a Proof

A “proof” in this project may include:

- A formal proof of a known theorem or lemma  
- A proof sketch with clearly stated assumptions or omitted steps  
- A counterexample  
- A proposition or lemma formulated and proved by the author  
- A rewritten or clarified proof of a previously known result  
- A short result that supports or motivates a larger theorem  

This years emphasis is on correctness, clarity, and understanding — not originality.

---

## Challenge Rules
1. One day, one proof
    - The proof must be started and completed on the same day
    - Length of proof does not matter 
2. Must be typeset in LaTeX
    - Each weeks folder will contain the work for that week 
    - The days changes must be pushed daily
        - In the event that I complete these proofs on paper while away from home, then 
            1. I must have a timestamped photo of the proof for that day 
            2. The proofs must be typeset and pushed within 24 hours of returning
3. No retroactive filling 
    - Missed days stay missed and are documented below
4. Correctness beats difficulty
    - This is a learning experience and although I will be looking to challenge 
    myself, not every proof will be of great complexity
    - This allows me to revist "easier" proofs and approach them from different avenues
5. Sources must be cited  
    - If I use anothers work in my weekly logs, it must be properly cited 
6. Revisions are allowed
    - I am allowed to revist previous days proofs and revise them 
    - This does **not** count as a daily proof 
    - Revisions may only be done after completing the proof for that day 
7. One commit per proof 
    - All commits made for a given day must be pushed by the end of the day 
    - In the event that I complete these proofs on paper while away from home, then 
        1. I must have a timestamped photo of the proof for that day 
        2. The proofs must be typeset and pushed within 48 hours of returning

---

## Repository Structure
```text
proof-a-day/
├── 2026/
│   ├── week01.tex
│   ├── week02.tex
│   └── ...
├── preamble.tex
├── main.tex
├── Makefile 
└── README.md
```
Each file contains dated entired. Compilation is handled using `latexmk`. 

---

## Build Instructions

This document describes how to build the LaTeX document for the **Proof a Day**
project using the provided `Makefile`.

The build system is intentionally simple and explicit, relying only on
standard TeX Live tools and GNU Make.

---

### Overview

The project compiles a single PDF (`main.pdf`) from a collection of LaTeX
source files:

- `main.tex` is the root document
- `preamble.tex` contains shared macros and environments
- Proofs live in subdirectories (e.g. `2026/`)
- The `Makefile` orchestrates compilation using `pdflatex`

Any change to a `.tex` file automatically triggers a rebuild.

---

### Requirements

#### Required software

- **TeX Live** (or equivalent LaTeX distribution)
- **GNU Make**
- **pdflatex** (included with TeX Live)
- (optional) [inotify-tools](https://github.com/inotify-tools/inotify-tools) 

On Ubuntu/Debian:
```bash
sudo apt install texlive-latex-extra make
# Verify installation 
pdflatex --version
make --version
```
