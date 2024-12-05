NAME = so_long

SRCS =	src/main.c \
		src/check_utils.c \
		src/checking_it.c \
		src/freeing_it.c \
		src/initialise.c \
		src/key_hooks.c \
		src/moving_it.c \
		src/terminal_it.c \
		src/utils.c

CC = @cc
RM = @rm -f
LIBFT_DIR = ./libft
MLX_DIR = ./mlx
CFLAGS =  -g -Wall -Werror -Wextra -Iinclude/mlx
MLX_FLAGS = -Lmlx -lmlx -L/usr/lib/X11 -lXext -lX11
# here to add libs from gnl
LIBS = $(LIBFT_DIR)/libft.a $(MLX_DIR)/libmlx.a
OBJS =	$(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(MAKE) -C $(LIBFT_DIR)
	$(MAKE) -C $(MLX_DIR)
	$(CC) $(CFLAGS) $(MLX_FLAGS) $(OBJS) $(LIBS) -o $(NAME)	

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS)
	$(MAKE) -C $(LIBFT_DIR) clean
	$(MAKE) -C $(MLX_DIR) clean

fclean: clean
	$(RM) $(NAME)
	$(RM) $(MLX_DIR)/libmlx.a

re: fclean all

.PHONY: all libft clean fcelan re