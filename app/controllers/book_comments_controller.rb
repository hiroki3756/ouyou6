class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        comment = BookComment.new(book_comment_params)
        comment.user_id = current_user.id
        comment.book_id = book.id
        comment.save
        redirect_to book_path(book)
    end

    def destroy
        book = Book.find(params[:id])
        comment = BookComment.find(params[:book_id])
        comment.destroy
        redirect_to book_path(book), notice: "successfully delete book!"
    end


    private
        def book_comment_params
            params.require(:book_comment).permit(:comment, :book_id, :user_id)
        end
end
