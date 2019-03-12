# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dzboncak <dzboncak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/06 20:19:04 by dzboncak          #+#    #+#              #
#    Updated: 2019/03/06 20:19:04 by dzboncak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

NAME = libftprintf.a

FLAGS = -Wall -Wextra -Werror

LIBFT = libft

DIR_S = srcs

DIR_O = objs

HEADER = includes

SOURCES = char.c \
		  ft_printf.c\
		  get_types.c\
		  itoa_d.c\
		  itoa.c\
		  itoa2.c\
		  numeric.c\
		  parse_start.c\
		  precision.c\
		  tools.c\
		  width.c\
		  double_to_binary.c\
		  width2.c\
		  fd.c

SRCS = $(addprefix $(DIR_S)/,$(SOURCES))

OBJS = $(addprefix $(DIR_O)/,$(SOURCES:.c=.o))

all: $(NAME)

$(NAME): $(OBJS)
		@make -C $(LIBFT)
		@cp libft/libft.a ./$(NAME)
		@ar rc $(NAME) $(OBJS)
		@ranlib $(NAME)

$(DIR_O)/%.o: $(DIR_S)/%.c
		@mkdir -p $(DIR_O)
		@$(CC) $(FLAGS) -I $(HEADER) -o $@ -c $<

norme:
		norminette ./libft/
		@echo
		norminette ./$(HEADER)/
		@echo
		norminette ./$(DIR_S)/

clean:
	@rm -f $(OBJS)
	@rm -rf $(DIR_O)
	@make clean -C $(LIBFT)

fclean: clean
	@rm -f $(NAME)
	@make fclean -C $(LIBFT)

re: fclean all

test:
	$(CC) main.c -L. -lftprintf -I./$(HEADER)

debug: libftprintf.a main.c
	$(CC) -g3 main.c srcs/*.c -L. -lftprintf -I./$(HEADER) -o debug
