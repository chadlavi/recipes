#!/bin/sh

start="---
title: Recipes
---

# Recipes

It’s recipes. You know, to cook with. 

<https://github.com/chadlavi/recipes>

## Categories
[Breads](#breads) &middot; [Breakfasts](#breakfasts) &middot; [Desserts](#desserts) &middot; [Main courses](#main-courses) &middot; [Pasta](#pasta) &middot; [Pizza](#pizza) &middot; [Salads](#salads) &middot; [Sandwiches](#sandwiches) &middot; [Sides and dips](#sides-and-dips) &middot; [Snacks](#snacks) &middot; [Soup](#soup) &middot; [Cured and pickled](#cured-and-pickled) &middot; [Condiments, sauces and toppings](#condiments-sauces-and-toppings) &middot; [Cocktails](#cocktails) &middot; [Coffee and tea](#coffee-and-tea) &middot; [Brewing](#brewing)

## Contents"

end="🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🥝🍅🥑🍆🥔🥕🌽🌶🥒🍄🥜🌰🍞🥐🥖🥞🧀🍖🍗🥓🍔🍟🍕🌭🌮🌯🍳🍲🥗🍿🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🍡🍦🍧🍨🍩🍪🎂🍰🍫🍬🍭🍮🍯🍼🥛☕🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🍽🍴🥄

<i>Inspired by <https://github.com/shaniber/recipes></i>
"

getMarkdownLinks() {
  for file in $(find . -iname "*.md" -not -name "README.md" -not -iname "*template*"); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

filter() {
  echo "$1" | grep -E "$2"
}

markdownLinks="$(getMarkdownLinks)"
drinkLinks="$(filter "$markdownLinks" drink | sort)"
foodLinks="$(filter "$markdownLinks" food | sort)"

echo "$start

### Breads
$(filter "$foodLinks" "/bread")

### Breakfasts
$(filter "$foodLinks" breakfast)

### Desserts
$(filter "$foodLinks" desserts)

### Main courses
$(filter "$foodLinks" mains)

### Pasta
$(filter "$foodLinks" pasta)

### Pizza
$(filter "$foodLinks" pizza)

### Salads
$(filter "$foodLinks" salads)

### Sandwiches
$(filter "$foodLinks" sandwiches)

### Snacks
$(filter "$foodLinks" snacks)

### Soup
$(filter "$foodLinks" soup)

### Cured and pickled
$(filter "$foodLinks" cured-pickled)

### Sides and dips
$(filter "$foodLinks" sides-dips)

### Condiments, sauces and toppings
$(filter "$foodLinks" condiments-sauces-toppings)

### Cocktails
$(filter "$drinkLinks" cocktails)

### Coffee and Tea
$(filter "$drinkLinks" coffee\|tea)

### Brewing
$(filter "$drinkLinks" beers)

$end"
