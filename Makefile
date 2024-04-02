# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rsaueia- <rsaueia-@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/01 16:49:02 by rsaueia-          #+#    #+#              #
#    Updated: 2024/04/02 15:50:14 by rsaueia-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# VARIABLES

NAME = fractol
CC = cc
HEADER = fractol.h
MLX = -Lminilibx-linux -lmlx_Linux -lX11 -lXext
CFLAGS	= -Wall -Wextra -Werror

# **************************************************************************** #
# SOURCES

SRC = fractol.c events.c fractol_init.c math_aux.c render.c string_aux.c 
OBJ = $(SRC:.c=.o)

# **************************************************************************** #
# RULES

all : $(NAME)

$(NAME) : $(OBJ)
	@$(CC) $(CFLAGS) $(OBJ) $(MLX) -o $(NAME)
	@echo "$(GREEN)$(NAME) compiled :)$(END_COLOR)"

%.o : %.c $(HEADER)
	@$(CC) $(CFLAGS) -c $<
	@echo "$(BLUE)Compiling $(notdir $<)$(END_COLOR)"

clean:
	@rm -rf $(OBJ)
	@echo "$(YELLOW)$(NAME) object & dependency files cleaned.$(END_COLOR)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(YELLOW)$(NAME) executable file cleaned.$(END_COLOR)"

re: fclean all
	@echo "$(GREEN)Cleaned all and rebuilt $(NAME)!$(END_COLOR)"

# **************************************************************************** #
# PHONY

.PHONY: all clean fclean re
