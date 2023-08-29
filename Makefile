##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile
##

NAME = test

IDIR = include/
IDIR_MY	= lib/my/include/

LIB	= libmy.a
LNAME = my
LDIR = lib/my

DIR	= src/

CFLAGS = -Wall -Wextra -g3

FILES = main.c \

SRCS = $(addprefix $(DIR), $(FILES))

OBJS = $(SRCS:.c=.o)

all: $(LIB) $(NAME)

$(LIB):
	make -C $(LDIR)

$(NAME): $(OBJS)
	gcc -o $(NAME) $(OBJS) -L $(LDIR) -l $(LNAME) $(CFLAGS)

clean:
	rm -f $(OBJS)
	make -C $(LDIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LDIR) fclean

re: fclean all

.PHONY: all clean fclean re
